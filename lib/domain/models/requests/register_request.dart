import 'package:login_sample_app/domain/models/requests/send_sign_up_code_request.dart';

class RegisterRequest {
  RegisterRequest({
    this.type,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.company,
    this.uid,
    this.verifyCode,
  });

  final String? type;
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? company;
  final String? uid;
  final String? verifyCode;

  factory RegisterRequest.fromJson(Map<String, dynamic> json) {
    return RegisterRequest(
      type: json["type"],
      email: json["email"],
      password: json["password"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      company: json["company"],
      uid: json["uid"],
      verifyCode: json["verify_code"],
    );
  }

  factory RegisterRequest.fromSendCodeRequest({
    required SendSignUpCodeRequest sendSignUpCodeRequest,
    required String code,
  }) {
    return RegisterRequest(
      type: sendSignUpCodeRequest.type,
      email: sendSignUpCodeRequest.email,
      password: sendSignUpCodeRequest.password,
      firstName: sendSignUpCodeRequest.firstName,
      lastName: sendSignUpCodeRequest.lastName,
      company: sendSignUpCodeRequest.company,
      verifyCode: code,
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "email": email,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
        "uid": uid,
        "verify_code": verifyCode,
      };
}
