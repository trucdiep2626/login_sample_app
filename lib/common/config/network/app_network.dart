import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/domain/models/response/base_response.dart';
import 'package:login_sample_app/l10n/l10n.dart';

class ApiClient {
  static const contentType = 'Content-Type';
  static const contentTypeJson = 'application/json; charset=utf-8';

  static final BaseOptions defaultOptions = BaseOptions(
    connectTimeout: const Duration(milliseconds: NetworkConfig.timeout),
    sendTimeout: const Duration(milliseconds: NetworkConfig.timeout),
    receiveTimeout: const Duration(milliseconds: NetworkConfig.timeout),
    responseType: ResponseType.json,
  );

  Dio _dio = Dio();

  static final Map<BaseOptions, ApiClient> _instanceMap = {};

  factory ApiClient({BaseOptions? options}) {
    options ??= defaultOptions;
    if (_instanceMap.containsKey(options)) {
      return _instanceMap[options] ?? ApiClient();
    }
    final ApiClient apiClient = ApiClient._create(options: options);
    _instanceMap[options] = apiClient;
    return apiClient;
  }

  ApiClient._create({BaseOptions? options}) {
    options ??= defaultOptions;
    _dio = Dio(options);
    _dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: true,
      error: true,
    ));
  }

  static ApiClient get instance => ApiClient();

  String _getMethod(NetworkMethod method) {
    switch (method) {
      case NetworkMethod.get:
        return 'GET';
      case NetworkMethod.post:
        return 'POST';
      case NetworkMethod.delete:
        return 'DELETE';
      case NetworkMethod.patch:
        return 'PATCH';
      case NetworkMethod.put:
        return 'PUT';
      default:
        return 'GET';
    }
  }

  Map<String, String> _getHeader({String? token}) {
    Map<String, String> header = {
      'Accept': 'application/json',
      Constants.apiKey: Constants.apiKeyValue,
    };

    if (!isNullEmpty(token)) {
      header.addAll({'Authorization': 'Bearer $token'});
    }
    return header;
  }

  String _getBaseUrl() => Flavor.baseURL;

  Future<dynamic> request({
    String? path,
    NetworkMethod method = NetworkMethod.get,
    Map<String, dynamic>? data,
    Function? fromJsonModel,
    Map<String, dynamic>? formData,
    Map<String, dynamic>? queryParameters,
    String? token,
    String? fullPath,
    bool getFullResponse = false,
  }) async {
    // Kiểm tra có kết nối internet hay không
    var connectivityResult = await checkConnectivity();
    if (!connectivityResult) {
      throw NoInternetException(1000, L10n.current.no_internet_connection);
    }

    if (isNullEmpty(path) && isNullEmpty(fullPath)) {
      logger.v('!!!!!!EMPTY URL!!!!!! - data: $data');
    }

    String url =
        isNullEmpty(fullPath) ? (_getBaseUrl() + (path ?? '')) : fullPath!;
    Response response;
    print('-----------------$url');
    try {
      String? newToken;

      if (token != null && path != NetworkConfig.refreshToken) {
        DateTime? expiryDate = Jwt.getExpiryDate(token);
        if (expiryDate != null && expiryDate.isBefore(DateTime.now())) {
          newToken = await refreshToken();
        }
      }

      var strMethod = _getMethod(method);
      response = await _dio.request(url,
          data: formData != null
              ? FormData.fromMap(formData)
              : data ?? jsonEncode({}),
          options: Options(
              method: strMethod,
              sendTimeout: const Duration(milliseconds: NetworkConfig.timeout),
              receiveTimeout:
                  const Duration(milliseconds: NetworkConfig.timeout),
              headers: _getHeader(token: newToken ?? token),
              contentType: formData != null ? 'multipart/form-data' : null),
          queryParameters: queryParameters);
      print('-----------------$response');
      if (response.statusCode != 401) {
        return _processResponse(response, getFullResponse);
      }
    } on DioException catch (e) {
      if (e.response != null) {
        return _processResponse(e.response!, getFullResponse);
      } else {
        throw ApiExceptions(10000, '', '', e.message, []);
      }
    }
  }

  dynamic _processResponse(Response response, bool getFullResponse) {
    final statusCode = response.statusCode;
    final body = BaseResponse.fromJson(response.data);

    /// A switch statement that handles the response status code.
    switch (response.statusCode) {
      /// Success status
      case 200:
      case 201:
        print('Response │ Status: $statusCode');
        // logger.v(
        //   body,
        //   'Response │ Status: $statusCode\n$url',
        // );
        // final responseJson = body['data'];
        return getFullResponse ? body : body.response;

      /// Errors status
      case 400:
        print('Response │ Status: $statusCode');
        logger.v(
          body,
          'Response │ Status: $statusCode',
        );
        throw BadRequestException(
          int.tryParse(body.meta?.status.toString() ?? '') ?? statusCode,
          body.meta?.message ?? '',
        );

      case 404:
        print('Response │ Status: $statusCode');

        final responseJson = body.meta?.message ?? '';
        logger.v(
          body,
          'Response │ Status: $statusCode',
        );
        throw NotFoundException(
          statusCode,
          responseJson.toString(),
        );

      /// Validate error status
      case 413:
        print('Response │ Status: $statusCode');
        logger.v(
          'PostFileException',
          'Response │ Status: $statusCode',
        );
        throw PostFileException(
          statusCode,
          'Post File Exception',
        );

      /// Validate error status
      case 422:
        print('Response │ Status: $statusCode');
        logger.v(
          body,
          'Response │ Status: $statusCode',
        );
        final responseJson = body.response;
        throw ValidateException(
          statusCode,
          body.meta?.message ?? '',
          (responseJson is List
                  ? isNullEmptyList(responseJson)
                  : isNullEmpty(responseJson))
              ? [body.meta?.message ?? '']
              : responseJson.values.toList() as List<dynamic>,
        );

      /// Server error status
      case 502:
      case 500:
        print('Response │ Status: $statusCode');
        throw FetchDataException(
          statusCode,
          'Fetch Data Exception',
        );
      default:
    }
  }

  Future<String> refreshToken() async {
    //  LoginResponse? loginResponse = await getIt<AccountUseCase>().refreshToken();

    // Return the new access token
    //   return loginResponse?.accessToken ?? '';
    return '';
  }
}
