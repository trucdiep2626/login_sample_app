class LoginRequest {
  LoginRequest({
     this.type,
     this.email,
     this.password,
  });

  final String? type;
  final String? email;
  final String? password;

  factory LoginRequest.fromJson(Map<String, dynamic> json){
    return LoginRequest(
      type: json["type"],
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() => {
    "type": 'passenger',
    "email": email,
    "password": password,
  };

}