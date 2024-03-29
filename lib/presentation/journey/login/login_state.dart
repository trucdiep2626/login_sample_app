import 'package:login_sample_app/common/common_export.dart';

class LoginState {
  bool enableButton;
  bool showPassword;
  LoadedType buttonLoadedType;
  String? errorText;
  bool emailErrorBorder;
  bool passwordErrorBorder;
  UserType? userType;

  LoginState({
    this.showPassword = false,
    this.enableButton = false,
    this.buttonLoadedType = LoadedType.finish,
    this.errorText,
    this.emailErrorBorder = false,
    this.passwordErrorBorder = false,
    this.userType,
  });

  LoginState copyWith({
    bool? showPassword,
    bool? enableButton,
    LoadedType? buttonLoadedType,
    String? errorText,
    bool? emailErrorBorder,
    bool? passwordErrorBorder,
    UserType? userType,
  }) {
    return LoginState(
      showPassword: showPassword ?? this.showPassword,
      enableButton: enableButton ?? this.enableButton,
      buttonLoadedType: buttonLoadedType ?? this.buttonLoadedType,
      errorText: errorText ?? this.errorText,
      emailErrorBorder: emailErrorBorder ?? this.emailErrorBorder,
      passwordErrorBorder: passwordErrorBorder ?? this.passwordErrorBorder,
      userType: userType ?? this.userType,
    );
  }
}
