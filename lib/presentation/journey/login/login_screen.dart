import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:login_sample_app/presentation/journey/login/login_state_notifier.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/app_text.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen>
    with TickerProviderStateMixin, LayoutExtension {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final arg = ModalRoute.of(context)?.settings.arguments as UserType? ??
          UserType.passenger;
      ref.read(loginProvider.notifier).initData(arg);
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginState = ref.watch(loginProvider);
    final loginStateNotifier = ref.read(loginProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        showBackButton: true,
        title:
            '${UserTypeHelper.getUserTypeLabel(loginState.userType ?? UserType.passenger)} - ${L10n.current.sign_in}',
      ),
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
              AppText(
                L10n.current.sign_in,
                style: ThemeText.bodySemibold.s24,
              ),
              SizedBox(
                height: AppDimens.height_28,
              ),
              if (loginState.userType == UserType.tourGuide)
                Padding(
                  padding: EdgeInsets.only(bottom: AppDimens.space_12),
                  child: AppTextField(
                    borderColor: AppColors.blue,
                    prefixIcon: const Icon(Icons.numbers),
                    hintText: L10n.current.booking_ref,
                    controller: loginStateNotifier.bookingRefController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: loginStateNotifier.bookingRefFocusNode,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                ),
              AppTextField(
                borderColor: loginState.emailErrorBorder
                    ? AppColors.red
                    : AppColors.blue,
                prefixIcon: const Icon(Icons.person),
                hintText: L10n.current.email,
                controller: loginStateNotifier.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusNode: loginStateNotifier.emailFocusNode,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              SizedBox(
                height: AppDimens.space_12,
              ),
              AppTextField(
                borderColor: loginState.passwordErrorBorder
                    ? AppColors.red
                    : AppColors.blue,
                prefixIcon: const Icon(Icons.password),
                suffixIcon: AppTouchable(
                  onPressed: () => loginStateNotifier.onPressedShowPassword(),
                  child: Icon(
                    loginState.showPassword
                        ? Icons.visibility_off
                        : Icons.visibility,
                    color: AppColors.grey3,
                  ),
                ),
                hintText: L10n.current.password,
                controller: loginStateNotifier.passwordController,
                obscureText: !loginState.showPassword,
                textInputAction: TextInputAction.done,
                focusNode: loginStateNotifier.passwordFocusNode,
                onEditingComplete: () => loginStateNotifier.onPressedLogIn(),
              ),
              !isNullEmpty(loginState.errorText)
                  ? Container(
                      margin: EdgeInsets.only(
                        top: AppDimens.space_4,
                      ),
                      width: screenWidth - AppDimens.space_16 * 2,
                      child: AppText(
                        loginState.errorText ?? '',
                        style: ThemeText.errorText,
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: AppDimens.space_8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: AppTouchable(
                  onPressed: () => NavigationService.routeTo(
                    RouteGenerator.forgotPassword,
                    arguments: loginState.userType,
                  ),
                  child: AppText(
                    L10n.current.forgot_password,
                    style: ThemeText.bodyMedium.s13,
                  ),
                ),
              ),
              SizedBox(
                height: AppDimens.space_36,
              ),
              AppButton(
                iconData: Icons.groups,
                onPressed: () => loginStateNotifier.onPressedLogIn(),
                enable: loginState.enableButton,
                title:
                    '${UserTypeHelper.getUserTypeLabel(loginState.userType ?? UserType.passenger)} - ${L10n.current.sign_in}',
                loaded: loginState.buttonLoadedType,
              ),
              SizedBox(
                height: AppDimens.space_12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    L10n.current.dont_have_account,
                    style: ThemeText.bodyMedium.s13.grey1_5,
                  ),
                  AppTouchable(
                    onPressed: () => NavigationService.routeTo(
                      RouteGenerator.register,
                      arguments: loginState.userType,
                    ),
                    padding: EdgeInsets.only(left: AppDimens.space_4),
                    child: AppText(
                      L10n.current.create_account,
                      style: ThemeText.bodySemibold.s13,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: AppDimens.height_36,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
