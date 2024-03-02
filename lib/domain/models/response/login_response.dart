import 'package:login_sample_app/domain/models/models/user_model.dart';

class LoginResponse {
  LoginResponse({
    required this.accessToken,
    required this.user,
    required this.type,
  });

  final String? accessToken;
  final UserModel? user;
  final String? type;

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      accessToken: json["access_token"],
      user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
      type: json["type"],
    );
  }
}
