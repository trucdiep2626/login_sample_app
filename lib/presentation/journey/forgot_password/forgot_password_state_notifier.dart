import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/common/di/injector.dart';
import 'package:login_sample_app/domain/models/requests/send_sign_up_code_request.dart';
import 'package:login_sample_app/domain/usecases/account_usecase.dart';
import 'package:login_sample_app/presentation/journey/forgot_password/forgot_password_state.dart';

final forgotPasswordProvider = StateNotifierProvider.autoDispose<
        ForgotPasswordStateNotifier, ForgotPasswordState>(
    (ref) => ForgotPasswordStateNotifier(
        ref: ref, accountUseCase: getIt<AccountUseCase>()));

class ForgotPasswordStateNotifier extends StateNotifier<ForgotPasswordState> {
  ForgotPasswordStateNotifier({
    required this.ref,
    required this.accountUseCase,
  }) : super(ForgotPasswordState()) {
    emailController.addListener(checkButtonEnable);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
  }

  void initData(UserType userType) {
    state = state.copyWith(
      enableButton: false,
      buttonLoadedType: LoadedType.finish,
      errorText: '',
      emailErrorBorder: false,
      userType: userType,
    );
    emailController.clear();
  }

  // Variable for Ref
  Ref ref;
  AccountUseCase accountUseCase;

  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();

  void checkButtonEnable() {
    if (emailController.text.isNotEmpty) {
      state = state.copyWith(enableButton: true);
    } else {
      state = state.copyWith(enableButton: false);
    }
  }

  Future<void> onPressedForgotPassword() async {
    hideKeyboard();
    state = state.copyWith(
      errorText: '',
      emailErrorBorder: false,
    );

    if (state.enableButton) {
      state = state.copyWith(buttonLoadedType: LoadedType.start);

      try {
        final result = await accountUseCase.forgotPassword(
          sendSignUpCodeRequest: SendSignUpCodeRequest(),
        );

        if (!isNullEmpty(result)) {
          // await accountUseCase.setAccessToken(result?.accessToken ?? '');
          // NavigationService.routeToAndRemoveUntil(
          //     RouteGenerator.main, (route) => false);
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
            emailErrorBorder: error.contains('email'),
          );
        } else {
          state = state.copyWith(errorText: e.message);
        }
      } finally {
        state = state.copyWith(buttonLoadedType: LoadedType.finish);
      }
    }
  }
}
