import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/domain/models/requests/send_sign_up_code_request.dart';

class VerifySignUpCodeState {
  bool enableButton;
  LoadedType buttonLoadedType;
  String? errorText;
  SendSignUpCodeRequest? sendSignUpCodeRequest;
  int? timeCountDown;

  VerifySignUpCodeState({
    this.enableButton = false,
    this.buttonLoadedType = LoadedType.finish,
    this.errorText,
    this.sendSignUpCodeRequest,
    this.timeCountDown,
  });

  VerifySignUpCodeState copyWith({
    bool? enableButton,
    LoadedType? buttonLoadedType,
    String? errorText,
    SendSignUpCodeRequest? sendSignUpCodeRequest,
    int? timeCountDown,
  }) {
    return VerifySignUpCodeState(
      enableButton: enableButton ?? this.enableButton,
      buttonLoadedType: buttonLoadedType ?? this.buttonLoadedType,
      errorText: errorText ?? this.errorText,
      sendSignUpCodeRequest:
          sendSignUpCodeRequest ?? this.sendSignUpCodeRequest,
      timeCountDown: timeCountDown ?? this.timeCountDown,
    );
  }
}
