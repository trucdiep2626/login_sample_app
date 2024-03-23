import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:login_sample_app/presentation/journey/forgot_password/forgot_password_state_notifier.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/app_text.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ForgotPasswordScreen> createState() =>
      _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen>
    with TickerProviderStateMixin, LayoutExtension {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final arg = ModalRoute.of(context)?.settings.arguments as UserType? ??
          UserType.passenger;
      ref.read(forgotPasswordProvider.notifier).initData(arg);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(forgotPasswordProvider);
    final stateNotifier = ref.read(forgotPasswordProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBarWidget(
        showBackButton: true,
        title:
            '${UserTypeHelper.getUserTypeLabel(state.userType ?? UserType.passenger)} - ${L10n.current.forgot_password}',
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
                L10n.current.forgot_password,
                style: ThemeText.bodySemibold.s24,
              ),
              SizedBox(
                height: AppDimens.height_28,
              ),
              AppTextField(
                borderColor:
                    state.emailErrorBorder ? AppColors.red : AppColors.blue,
                prefixIcon: const Icon(Icons.email),
                hintText: L10n.current.email,
                controller: stateNotifier.emailController,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                focusNode: stateNotifier.emailFocusNode,
                onEditingComplete: () => FocusScope.of(context).nextFocus(),
              ),
              SizedBox(
                height: AppDimens.space_12,
              ),
              !isNullEmpty(state.errorText)
                  ? Container(
                      margin: EdgeInsets.only(
                        top: AppDimens.space_4,
                      ),
                      width: screenWidth - AppDimens.space_16 * 2,
                      child: AppText(
                        state.errorText ?? '',
                        style: ThemeText.errorText,
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: AppDimens.space_24,
              ),
              AppButton(
                iconData: Icons.arrow_circle_right_rounded,
                onPressed: () => stateNotifier.onPressedForgotPassword(),
                enable: state.enableButton,
                title: L10n.current.send,
                loaded: state.buttonLoadedType,
              ),
              SizedBox(
                height: AppDimens.space_12,
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
