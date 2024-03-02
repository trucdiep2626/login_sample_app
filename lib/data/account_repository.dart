import 'package:login_sample_app/domain/models/requests/login_request.dart';
import 'package:login_sample_app/common/common_export.dart';

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
}
