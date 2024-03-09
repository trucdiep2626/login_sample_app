class SendSignUpCodeRequest {
  SendSignUpCodeRequest({
    this.type,
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.company,
  });

  final String? type;
  final String? email;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? company;

  factory SendSignUpCodeRequest.fromJson(Map<String, dynamic> json) {
    return SendSignUpCodeRequest(
      type: json["type"],
      email: json["email"],
      password: json["password"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      company: json["company"],
    );
  }

  Map<String, dynamic> toJson() => {
        "type": type,
        "email": email,
        "password": password,
        "first_name": firstName,
        "last_name": lastName,
        "company": company,
      };
}
