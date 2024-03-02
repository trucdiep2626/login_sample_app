import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/generated/assets.gen.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:login_sample_app/presentation/journey/login/login_state_notifier.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

class LoginScreen extends ConsumerWidget with LayoutExtension {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginState = ref.watch(loginProvider);
    final loginStateNotifier = ref.read(loginProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimens.space_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppDimens.height_52,
              ),
              Text(
                L10n.current.sign_in,
                style: ThemeText.bodySemibold.s24,
              ),
              SizedBox(
                height: AppDimens.height_28,
              ),
              AppTextField(
                borderColor: loginState.emailErrorBorder
                    ? AppColors.red
                    : AppColors.stroke,
                prefixIcon: AppImageWidget(
                  asset: Assets.images.svg.icUser,
                ),
                hintText: L10n.current.enter_email,
                controller: loginStateNotifier.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              SizedBox(
                height: AppDimens.space_12,
              ),
              AppTextField(
                borderColor: loginState.passwordErrorBorder
                    ? AppColors.red
                    : AppColors.stroke,
                prefixIcon: AppImageWidget(
                  asset: Assets.images.svg.icPassword,
                ),
                suffixIcon: AppTouchable(
                  onPressed: () => loginStateNotifier.onPressedShowPassword(),
                  child: Icon(
                    loginState.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.blue,
                  ),
                ),
                hintText: L10n.current.enter_password,
                controller: loginStateNotifier.passwordController,
                obscureText: !loginState.showPassword,
                textInputAction: TextInputAction.done,
                onEditingComplete: () => loginStateNotifier.onPressedLogIn(),
              ),
              SizedBox(
                height: AppDimens.space_8,
              ),
              !isNullEmpty(loginState.errorText)
                  ? Container(
                      margin: EdgeInsets.symmetric(
                        vertical: AppDimens.space_4,
                      ),
                      width: screenWidth - AppDimens.space_16 * 2,
                      child: Text(
                        loginState.errorText ?? '',
                        style: ThemeText.errorText,
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: AppDimens.space_12,
              ),
              AppButton(
                onPressed: () => loginStateNotifier.onPressedLogIn(),
                enable: loginState.enableButton,
                title: L10n.current.sign_in,
                loaded: loginState.buttonLoadedType,
                backgroundColor: AppColors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
