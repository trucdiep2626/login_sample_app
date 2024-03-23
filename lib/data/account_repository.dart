import 'package:login_sample_app/domain/models/requests/login_request.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/domain/models/requests/register_request.dart';
import 'package:login_sample_app/domain/models/requests/send_sign_up_code_request.dart';
import 'package:login_sample_app/domain/models/response/base_response.dart';

class AccountRepository {
  AccountRepository({required this.client});

  final ApiClient client;

  Future<Map<String, dynamic>?> login({
    required LoginRequest loginRequest,
  }) async {
    var baseRes = await client.request(
      method: NetworkMethod.post,
      path: NetworkConfig.login,
      data: loginRequest.toJson(),
    );
    print('------$baseRes');
    return baseRes;
  }

  Future<BaseResponse?> sendSignUpCode({
    required SendSignUpCodeRequest sendSignUpCodeRequest,
  }) async {
    var baseRes = await client.request(
      method: NetworkMethod.post,
      path: NetworkConfig.sendSignUpCode,
      data: sendSignUpCodeRequest.toJson(),
      getFullResponse: true,
    );
    print('------$baseRes');
    return baseRes;
  }

  Future<Map<String, dynamic>?> register({
    required RegisterRequest registerRequest,
  }) async {
    var baseRes = await client.request(
      method: NetworkMethod.post,
      path: NetworkConfig.register,
      data: registerRequest.toJson(),
    );
    print('------$baseRes');
    return baseRes;
  }

  Future<BaseResponse?> forgotPassword({
    required SendSignUpCodeRequest sendSignUpCodeRequest,
  }) async {
    var baseRes = await client.request(
      method: NetworkMethod.post,
      path: NetworkConfig.sendSignUpCode,
      data: sendSignUpCodeRequest.toJson(),
      getFullResponse: true,
    );
    print('------$baseRes');
    return baseRes;
  }
}
