import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/common/di/injector.dart';
import 'package:login_sample_app/domain/models/requests/register_request.dart';
import 'package:login_sample_app/domain/usecases/account_usecase.dart';
import 'package:login_sample_app/presentation/journey/verify_sign_up_code/verify_sign_up_code_screen.dart';
import 'package:login_sample_app/presentation/journey/verify_sign_up_code/verify_sign_up_code_state.dart';
import 'package:login_sample_app/presentation/widgets/snack_bar/app_snack_bar.dart';

final verifySignUpCodeProvider = StateNotifierProvider.autoDispose<
        VerifySignUpCodeStateNotifier, VerifySignUpCodeState>(
    (ref) => VerifySignUpCodeStateNotifier(
        ref: ref, accountUseCase: getIt<AccountUseCase>()));

class VerifySignUpCodeStateNotifier
    extends StateNotifier<VerifySignUpCodeState> {
  VerifySignUpCodeStateNotifier({
    required this.ref,
    required this.accountUseCase,
  }) : super(VerifySignUpCodeState()) {
    pinController = TextEditingController();
    pinController.addListener(checkButtonEnable);
  }

  void initData(VerifySignUpCodeArguments args) {
    final timeCountDown = (int.tryParse(args.timeout) ?? 10) * 60;
    startCountDown(timeCountDown);
    state = state.copyWith(
      enableButton: false,
      buttonLoadedType: LoadedType.finish,
      errorText: '',
      sendSignUpCodeRequest: args.sendSignUpCodeRequest,
      timeCountDown: timeCountDown,
    );

    pinController.clear();
  }

  // Variable for Ref
  Ref ref;
  AccountUseCase accountUseCase;
  Timer? timer;

  late TextEditingController pinController;

  void removeOTPError() {
    state = state.copyWith(
      errorText: '',
    );
  }

  void startCountDown(int time) {
    state = state.copyWith(timeCountDown: time);
    var _start = time;

    const oneSec = Duration(seconds: 1);

    if (timer != null) {
      timer!.cancel();
    }

    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (mounted) {
          if (_start == 0) {
            state = state.copyWith(timeCountDown: 0);
            timer.cancel();
          } else {
            _start--;
            state = state.copyWith(timeCountDown: _start);
          }
        }
      },
    );
  }

  String formatTimeCountDown(int a) {
    if (a < 10) {
      return '0$a';
    }
    return a.toString();
  }

  void checkButtonEnable() {
    if (pinController.text.isNotEmpty && pinController.text.length == 5) {
      state = state.copyWith(enableButton: true);
    } else {
      state = state.copyWith(enableButton: false);
    }
  }

  Future<void> onPressedVerifySignUpCode() async {
    hideKeyboard();
    state = state.copyWith(
      errorText: '',
    );

    if (state.enableButton) {
      state = state.copyWith(buttonLoadedType: LoadedType.start);

      try {
        final result = await accountUseCase.register(
            registerRequest: RegisterRequest.fromSendCodeRequest(
                sendSignUpCodeRequest: state.sendSignUpCodeRequest!,
                code: pinController.text));

        if (!isNullEmpty(result)) {
          await accountUseCase.setAccessToken(result?.accessToken ?? '');
          NavigationService.routeToAndRemoveUntil(
              RouteGenerator.main, (route) => false);
        }
      } on ApiExceptions catch (e) {
        if (e is ValidateException) {
          String error = '';
          e.errorValidate?.forEach((value) {
            if (value is List) {
              error += '${value.join('\n')}\n';
            } else if (value is String) {
              error += '$value\n';
            }
          });
          state = state.copyWith(
            errorText: error,
          );
        } else {
          state = state.copyWith(errorText: e.message);
        }
      } finally {
        state = state.copyWith(buttonLoadedType: LoadedType.finish);
      }
    }
  }

  Future<void> onPressedResendCode(BuildContext context) async {
    hideKeyboard();
    state = state.copyWith(
      errorText: '',
    );

    try {
      final result = await accountUseCase.sendSignUpCode(
          sendSignUpCodeRequest: state.sendSignUpCodeRequest!);

      if (result != null && ((result.meta?.status ?? 0) == 200)) {
        if (mounted) {
          showTopSnackBar(context, message: result.meta?.message ?? '');
          state = state.copyWith(
            timeCountDown: 10 * 60,
          );
          startCountDown(10 * 60);
        }
      }
    } on ApiExceptions catch (e) {
      if (e is ValidateException) {
        String error = '';
        e.errorValidate?.forEach((value) {
          if (value is List) {
            error += '${value.join('\n')}\n';
          } else if (value is String) {
            error += '$value\n';
          }
        });
        state = state.copyWith(
          errorText: error,
        );
      } else {
        state = state.copyWith(errorText: e.message);
      }
    } finally {
      state = state.copyWith(buttonLoadedType: LoadedType.finish);
    }
  }
}
