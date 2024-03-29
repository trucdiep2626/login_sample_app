import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/common/di/injector.dart';
import 'package:login_sample_app/domain/models/requests/login_request.dart';
import 'package:login_sample_app/domain/usecases/account_usecase.dart';
import 'package:login_sample_app/presentation/journey/login/login_state.dart';

final loginProvider =
    StateNotifierProvider.autoDispose<LoginStateNotifier, LoginState>((ref) =>
        LoginStateNotifier(ref: ref, accountUseCase: getIt<AccountUseCase>()));

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier({
    required this.ref,
    required this.accountUseCase,
  }) : super(LoginState()) {
    emailController.addListener(checkButtonEnable);
    passwordController.addListener(checkButtonEnable);
    bookingRefController.addListener(checkButtonEnable);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    bookingRefController.dispose();
  }

  void initData(UserType userType) {
    state = state.copyWith(
      enableButton: false,
      showPassword: false,
      buttonLoadedType: LoadedType.finish,
      errorText: '',
      emailErrorBorder: false,
      passwordErrorBorder: false,
      userType: userType,
    );
    emailController.clear();
    passwordController.clear();
    bookingRefController.clear();
  }

  // Variable for Ref
  Ref ref;
  AccountUseCase accountUseCase;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final bookingRefController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final bookingRefFocusNode = FocusNode();

  void checkButtonEnable() {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        (state.userType == UserType.passenger ||
            bookingRefController.text.isNotEmpty)) {
      state = state.copyWith(enableButton: true);
    } else {
      state = state.copyWith(enableButton: false);
    }
  }

  void onPressedShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  Future<void> onPressedLogIn() async {
    hideKeyboard();
    state = state.copyWith(
      errorText: '',
      emailErrorBorder: false,
      passwordErrorBorder: false,
    );

    if (state.enableButton) {
      state = state.copyWith(buttonLoadedType: LoadedType.start);

      try {
        final result = await accountUseCase.login(
          loginRequest: LoginRequest(
            email: emailController.text,
            password: passwordController.text,
            type: UserTypeHelper.getUserTypeString(
                state.userType ?? UserType.passenger),
          ),
        );

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
            emailErrorBorder: error.contains('email'),
            passwordErrorBorder: error.contains('password'),
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
