import 'package:login_sample_app/common/common_export.dart';

class RegisterState {
  bool enableButton;
  bool showPassword;
  bool showConfirmPassword;
  LoadedType buttonLoadedType;
  String? errorText;
  bool emailErrorBorder;
  bool passwordErrorBorder;
  UserType? userType;
  String? emailValidate;
  String? passwordValidate;
  String? confirmPasswordValidate;

  RegisterState({
    this.showPassword = false,
    this.showConfirmPassword = false,
    this.enableButton = false,
    this.buttonLoadedType = LoadedType.finish,
    this.errorText,
    this.emailErrorBorder = false,
    this.passwordErrorBorder = false,
    this.userType,
    this.emailValidate,
    this.passwordValidate,
    this.confirmPasswordValidate,
  });

  RegisterState copyWith({
    bool? showPassword,
    bool? showConfirmPassword,
    bool? enableButton,
    LoadedType? buttonLoadedType,
    String? errorText,
    bool? emailErrorBorder,
    bool? passwordErrorBorder,
    UserType? userType,
    String? emailValidate,
    String? passwordValidate,
    String? confirmPasswordValidate,
  }) {
    return RegisterState(
      showPassword: showPassword ?? this.showPassword,
      showConfirmPassword: showConfirmPassword ?? this.showConfirmPassword,
      enableButton: enableButton ?? this.enableButton,
      buttonLoadedType: buttonLoadedType ?? this.buttonLoadedType,
      errorText: errorText ?? this.errorText,
      emailErrorBorder: emailErrorBorder ?? this.emailErrorBorder,
      passwordErrorBorder: passwordErrorBorder ?? this.passwordErrorBorder,
      userType: userType ?? this.userType,
      emailValidate: emailValidate ?? this.emailValidate,
      passwordValidate: passwordValidate ?? this.passwordValidate,
      confirmPasswordValidate:
          confirmPasswordValidate ?? this.confirmPasswordValidate,
    );
  }
}
