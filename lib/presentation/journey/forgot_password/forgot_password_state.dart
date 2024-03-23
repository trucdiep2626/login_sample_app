import 'package:login_sample_app/common/common_export.dart';

class ForgotPasswordState {
  bool enableButton;
  LoadedType buttonLoadedType;
  String? errorText;
  bool emailErrorBorder;
  UserType? userType;

  ForgotPasswordState({
    this.enableButton = false,
    this.buttonLoadedType = LoadedType.finish,
    this.errorText,
    this.emailErrorBorder = false,
    this.userType,
  });

  ForgotPasswordState copyWith({
    bool? enableButton,
    LoadedType? buttonLoadedType,
    String? errorText,
    bool? emailErrorBorder,
    UserType? userType,
  }) {
    return ForgotPasswordState(
      enableButton: enableButton ?? this.enableButton,
      buttonLoadedType: buttonLoadedType ?? this.buttonLoadedType,
      errorText: errorText ?? this.errorText,
      emailErrorBorder: emailErrorBorder ?? this.emailErrorBorder,
      userType: userType ?? this.userType,
    );
  }
}
