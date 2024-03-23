import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:login_sample_app/presentation/journey/register/register_state_notifier.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen>
    with TickerProviderStateMixin, LayoutExtension {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final arg = ModalRoute.of(context)?.settings.arguments;
      if (arg is UserType) {
        ref.read(registerProvider.notifier).initData(arg);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerProvider);
    final registerStateNotifier = ref.read(registerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        showBackButton: true,
        title:
            '${UserTypeHelper.getUserTypeLabel(registerState.userType ?? UserType.passenger)} - ${L10n.current.register}',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppDimens.space_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: AppDimens.height_36,
              ),
              AppText(
                L10n.current.register,
                style: ThemeText.bodySemibold.s24,
              ),
              SizedBox(
                height: AppDimens.height_28,
              ),
              AppTextField(
                borderColor: registerState.emailErrorBorder
                    ? AppColors.red
                    : AppColors.blue,
                prefixIcon: const Icon(Icons.email),
                hintText: L10n.current.email,
                controller: registerStateNotifier.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                errorText: registerState.emailValidate ?? '',
                focusNode: registerStateNotifier.emailFocusNode,
                onEditingComplete: () => FocusScope.of(context)
                    .requestFocus(registerStateNotifier.bookingRefFocusNode),
              ),
              SizedBox(
                height: AppDimens.space_12,
              ),
              if (registerState.userType == UserType.tourGuide)
                Padding(
                  padding: EdgeInsets.only(bottom: AppDimens.space_12),
                  child: AppTextField(
                    borderColor: AppColors.blue,
                    prefixIcon: const Icon(Icons.numbers),
                    hintText: L10n.current.booking_ref,
                    controller: registerStateNotifier.bookingRefController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: registerStateNotifier.bookingRefFocusNode,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                ),
              if (registerState.userType == UserType.tourGuide)
                Padding(
                  padding: EdgeInsets.only(bottom: AppDimens.space_12),
                  child: AppTextField(
                    borderColor: AppColors.blue,
                    prefixIcon: const Icon(Icons.person),
                    hintText: L10n.current.first_name,
                    controller: registerStateNotifier.firstNameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: registerStateNotifier.firstNameFocusNode,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                ),
              if (registerState.userType == UserType.tourGuide)
                Padding(
                  padding: EdgeInsets.only(bottom: AppDimens.space_12),
                  child: AppTextField(
                    borderColor: AppColors.blue,
                    prefixIcon: const Icon(Icons.person),
                    hintText: L10n.current.last_name,
                    controller: registerStateNotifier.lastNameController,
                    keyboardType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    focusNode: registerStateNotifier.lastNameFocusNode,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                  ),
                ),
              AppTextField(
                borderColor: registerState.passwordErrorBorder
                    ? AppColors.red
                    : AppColors.blue,
                prefixIcon: const Icon(Icons.password),
                suffixIcon: AppTouchable(
                  onPressed: () =>
                      registerStateNotifier.onPressedShowPassword(),
                  child: Icon(
                    registerState.showPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.grey3,
                  ),
                ),
                hintText: L10n.current.password,
                controller: registerStateNotifier.passwordController,
                obscureText: !registerState.showPassword,
                focusNode: registerStateNotifier.passwordFocusNode,
                textInputAction: TextInputAction.next,
                onEditingComplete: () => FocusScope.of(context).requestFocus(
                    registerStateNotifier.confirmPasswordFocusNode),
                errorText: registerState.passwordValidate ?? '',
              ),
              SizedBox(
                height: AppDimens.space_12,
              ),
              AppTextField(
                borderColor: registerState.passwordErrorBorder
                    ? AppColors.red
                    : AppColors.blue,
                prefixIcon: const Icon(Icons.password),
                suffixIcon: AppTouchable(
                  onPressed: () =>
                      registerStateNotifier.onPressedShowConfirmPassword(),
                  child: Icon(
                    registerState.showConfirmPassword
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: AppColors.grey3,
                  ),
                ),
                hintText: L10n.current.confirm_password,
                controller: registerStateNotifier.confirmPasswordController,
                obscureText: !registerState.showConfirmPassword,
                textInputAction: TextInputAction.done,
                focusNode: registerStateNotifier.confirmPasswordFocusNode,
                errorText: registerState.confirmPasswordValidate ?? '',
                onEditingComplete: () =>
                    registerStateNotifier.onPressedRegister(context),
              ),
              SizedBox(
                height: AppDimens.space_8,
              ),
              !isNullEmpty(registerState.errorText)
                  ? Container(
                      margin: EdgeInsets.symmetric(
                        vertical: AppDimens.space_4,
                      ),
                      width: screenWidth - AppDimens.space_16 * 2,
                      child: AppText(
                        registerState.errorText ?? '',
                        style: ThemeText.errorText,
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: AppDimens.space_12,
              ),
              AppButton(
                onPressed: () =>
                    registerStateNotifier.onPressedRegister(context),
                enable: registerState.enableButton,
                iconData: Icons.arrow_circle_right_rounded,
                title: L10n.current.register,
                loaded: registerState.buttonLoadedType,
              ),
              SizedBox(
                height: AppDimens.space_12,
              ),
              RichText(
                text: TextSpan(
                  text: L10n.current.aldready_have_account,
                  style: ThemeText.bodyRegular.s13.grey1_5,
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: AppTouchable(
                        onPressed: () => NavigationService.goBack(),
                        padding: EdgeInsets.only(left: AppDimens.space_4),
                        child: AppText(
                          L10n.current.sign_in_here,
                          style: ThemeText.bodySemibold.s13.grey4,
                        ),
                      ),
                    ),
                  ],
                ),
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
