import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/domain/models/requests/send_sign_up_code_request.dart';
import 'package:login_sample_app/generated/assets.gen.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:login_sample_app/presentation/journey/verify_sign_up_code/verify_sign_up_code_state_notifier.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/app_text.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifySignUpCodeArguments {
  final SendSignUpCodeRequest sendSignUpCodeRequest;
  final String timeout;

  VerifySignUpCodeArguments({
    required this.sendSignUpCodeRequest,
    required this.timeout,
  });
}

class VerifySignUpCodeScreen extends ConsumerStatefulWidget {
  const VerifySignUpCodeScreen({super.key});

  @override
  ConsumerState<VerifySignUpCodeScreen> createState() =>
      _VerifySignUpCodeScreenState();
}

class _VerifySignUpCodeScreenState extends ConsumerState<VerifySignUpCodeScreen>
    with TickerProviderStateMixin, LayoutExtension {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final arg = ModalRoute.of(context)?.settings.arguments;
      if (arg is VerifySignUpCodeArguments) {
        ref.read(verifySignUpCodeProvider.notifier).initData(arg);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(verifySignUpCodeProvider);
    final stateNotifier = ref.read(verifySignUpCodeProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const AppBarWidget(
        showBackButton: true,
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
              AppImageWidget(
                size: AppDimens.space_84,
                asset: Assets.images.png.imgTweetIcon,
              ),
              SizedBox(
                height: AppDimens.height_28,
              ),
              AppText(
                L10n.current.otp_verification,
                style: ThemeText.bodySemibold.s24,
              ),
              SizedBox(
                height: AppDimens.height_16,
              ),
              AppText(
                '${L10n.current.enter_otp} ${formatSecondToMinute(timeInSecond: int.parse(stateNotifier.formatTimeCountDown(state.timeCountDown ?? 0)))}',
                style: ThemeText.bodyRegular.s14,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: AppDimens.height_28,
              ),
              PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.red.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 5,

                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                // validator: (v) {
                //   if (v!.length < 3) {
                //     return "I'm from validator";
                //   } else {
                //     return null;
                //   }
                // },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: AppDimens.space_55,
                  fieldWidth: AppDimens.space_43,
                  activeFillColor: Colors.white,
                  inactiveFillColor: Colors.white,
                  inactiveColor: AppColors.grey2,
                  activeColor: AppColors.green2,
                  selectedColor: AppColors.green2,
                  selectedFillColor: Colors.white,
                ),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: stateNotifier.pinController,
                keyboardType: TextInputType.number,
                // boxShadows: const [
                //   BoxShadow(
                //     offset: Offset(0, 1),
                //     color: Colors.black12,
                //     blurRadius: 10,
                //   )
                // ],
                onCompleted: (v) => stateNotifier.onPressedVerifySignUpCode(),
                // onTap: () {
                //   print("Pressed");
                // }, ,
                beforeTextPaste: (text) {
                  debugPrint("Allowing to paste $text");
                  //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                  //but you can show anything you want here, like your pop up saying wrong paste format or etc
                  return true;
                },
              ),
              SizedBox(
                height: AppDimens.space_8,
              ),
              !isNullEmpty(state.errorText)
                  ? Container(
                      margin: EdgeInsets.symmetric(
                        vertical: AppDimens.space_4,
                      ),
                      width: screenWidth - AppDimens.space_16 * 2,
                      child: AppText(
                        state.errorText ?? '',
                        style: ThemeText.errorText,
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: AppDimens.space_12,
              ),
              AppButton(
                onPressed: () => stateNotifier.onPressedVerifySignUpCode(),
                enable: state.enableButton,
                title: L10n.current.submit,
                loaded: state.buttonLoadedType,
              ),
              SizedBox(
                height: AppDimens.space_28,
              ),
              RichText(
                text: TextSpan(
                  text: L10n.current.dont_receive_code,
                  style: ThemeText.bodyMedium.s13.grey1_5,
                  children: [
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: AppTouchable(
                        onPressed: () =>
                            stateNotifier.onPressedResendCode(context),
                        padding: EdgeInsets.only(left: AppDimens.space_4),
                        child: AppText(
                          L10n.current.resend,
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
