import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/data/account_repository.dart';
import 'package:login_sample_app/data/local_repository.dart';
import 'package:login_sample_app/domain/models/requests/login_request.dart';
import 'package:login_sample_app/domain/models/requests/register_request.dart';
import 'package:login_sample_app/domain/models/requests/send_sign_up_code_request.dart';
import 'package:login_sample_app/domain/models/response/base_response.dart';
import 'package:login_sample_app/domain/models/response/login_response.dart';

class AccountUseCase {
  final AccountRepository accountRepo;
  final LocalRepository localRepo;

  AccountUseCase({required this.accountRepo, required this.localRepo});

  Future<void> setAccessToken(String accessToken) async {
    await localRepo.saveSecureData(
        key: Constants.accessToken, value: accessToken);
  }

  Future<String?> getAccessToken() async {
    return await localRepo.getSecureData(key: Constants.accessToken);
  }

  Future<void> setRefreshToken(String refreshToken) async {
    await localRepo.saveSecureData(
        key: Constants.refreshToken, value: refreshToken);
  }

  Future<String?> getRefreshToken() async {
    return await localRepo.getSecureData(key: Constants.refreshToken);
  }

  Future<LoginResponse?> register({
    required RegisterRequest registerRequest,
  }) async {
    final result = await accountRepo.register(registerRequest: registerRequest);
    if (result != null) {
      final response = LoginResponse.fromJson(result);
      return response;
    }
    return null;
  }

  Future<BaseResponse?> sendSignUpCode({
    required SendSignUpCodeRequest sendSignUpCodeRequest,
  }) async {
    final result = await accountRepo.sendSignUpCode(
        sendSignUpCodeRequest: sendSignUpCodeRequest);
   return result;
  }

  Future<LoginResponse?> login({
    required LoginRequest loginRequest,
  }) async {
    final result = await accountRepo.login(loginRequest: loginRequest);
    if (result != null) {
      final response = LoginResponse.fromJson(result);
      return response;
    }
    return null;
  }

  Future<BaseResponse?> forgotPassword({
    required SendSignUpCodeRequest sendSignUpCodeRequest,
  }) async {
    final result = await accountRepo.sendSignUpCode(
        sendSignUpCodeRequest: sendSignUpCodeRequest);
    return result;
  }

  Future<void> logout() async {
    await localRepo.deleteAllSecureData();
  }
}
