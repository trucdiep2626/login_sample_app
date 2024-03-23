import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/common/di/injector.dart';
import 'package:login_sample_app/common/utils/app_validator.dart';
import 'package:login_sample_app/domain/models/requests/send_sign_up_code_request.dart';
import 'package:login_sample_app/domain/usecases/account_usecase.dart';
import 'package:login_sample_app/presentation/journey/register/register_state.dart';
import 'package:login_sample_app/presentation/journey/verify_sign_up_code/verify_sign_up_code_screen.dart';
import 'package:login_sample_app/presentation/widgets/snack_bar/app_snack_bar.dart';

final registerProvider =
    StateNotifierProvider.autoDispose<RegisterStateNotifier, RegisterState>(
        (ref) => RegisterStateNotifier(
            ref: ref, accountUseCase: getIt<AccountUseCase>()));

class RegisterStateNotifier extends StateNotifier<RegisterState> {
  RegisterStateNotifier({
    required this.ref,
    required this.accountUseCase,
  }) : super(RegisterState()) {
    emailController.addListener(checkButtonEnable);
    passwordController.addListener(checkButtonEnable);
    confirmPasswordController.addListener(checkButtonEnable);
    bookingRefController.addListener(checkButtonEnable);
    firstNameController.addListener(checkButtonEnable);
    lastNameController.addListener(checkButtonEnable);
  }

  // Variable for Ref
  Ref ref;
  AccountUseCase accountUseCase;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bookingRefController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmPasswordFocusNode = FocusNode();
  final bookingRefFocusNode = FocusNode();
  final firstNameFocusNode = FocusNode();
  final lastNameFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    bookingRefController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
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
    confirmPasswordController.clear();
    bookingRefController.clear();
    firstNameController.clear();
    lastNameController.clear();
  }

  void checkButtonEnable() {
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        (state.userType == UserType.passenger ||
            (bookingRefController.text.isNotEmpty &&
                firstNameController.text.isNotEmpty &&
                lastNameController.text.isNotEmpty))) {
      state = state.copyWith(enableButton: true);
    } else {
      state = state.copyWith(enableButton: false);
    }
  }

  void onPressedShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }

  void onPressedShowConfirmPassword() {
    state = state.copyWith(showConfirmPassword: !state.showConfirmPassword);
  }

  Future<void> onPressedRegister(BuildContext context) async {
    hideKeyboard();
    final confirmPasswordValidate = AppValidator.validateConfirmPassword(
        passwordController, confirmPasswordController);
    final passwordValidate = AppValidator.validatePassword(passwordController);
    final emailValidate = AppValidator.validateEmail(emailController);

    state = state.copyWith(
      errorText: '',
      emailValidate: emailValidate,
      passwordValidate: passwordValidate,
      confirmPasswordValidate: confirmPasswordValidate,
      emailErrorBorder: false,
      passwordErrorBorder: false,
    );

    if (confirmPasswordValidate.isNotEmpty ||
        emailValidate.isNotEmpty ||
        passwordValidate.isNotEmpty) {
      return;
    }

    if (state.enableButton) {
      state = state.copyWith(buttonLoadedType: LoadedType.start);

      try {
        final sendSignUpCodeRequest = SendSignUpCodeRequest(
          email: emailController.text,
          password: passwordController.text,
          type: UserTypeHelper.getUserTypeString(
              state.userType ?? UserType.passenger),
        );
        final result = await accountUseCase.sendSignUpCode(
            sendSignUpCodeRequest: sendSignUpCodeRequest);

        if (result != null && ((result.meta?.status ?? 0) == 200)) {
          if (mounted) {
            showTopSnackBar(context, message: result.meta?.message ?? '');
          }
          NavigationService.routeTo(
            RouteGenerator.verifySignUpCode,
            arguments: VerifySignUpCodeArguments(
              sendSignUpCodeRequest: sendSignUpCodeRequest,
              timeout: result.response ?? "10",
            ),
          );
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
