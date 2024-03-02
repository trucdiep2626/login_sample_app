import 'package:flutter/material.dart';
import 'package:login_sample_app/common/constants/app_dimens.dart';
import 'package:login_sample_app/common/constants/enums.dart';
import 'package:login_sample_app/common/utils/app_utils.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

import 'app_image_widget.dart';

class OutlinedAppButton {}

class AppButton extends StatelessWidget {
  final String title;
  final LoadedType? loaded;
  final Color? backgroundColor;
  final Color? titleColor;
  final double? width;
  final Function()? onPressed;
  final bool enable;
  final titleFontSize;
  final isOutlineButton;

  const AppButton({
    Key? key,
    this.isOutlineButton = false,
    this.enable = true,
    required this.title,
    this.loaded = LoadedType.finish,
    this.backgroundColor = AppColors.orange,
    this.titleColor = AppColors.white,
    this.titleFontSize,
    this.width,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: width ?? double.infinity,
          height: AppDimens.space_43,
          child: TextButton(
            onPressed: enable
                ? () {
                    hideKeyboard();
                    if (!isNullEmpty(onPressed)) {
                      onPressed!();
                    }
                  }
                : null,
            style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith(
                (states) => ThemeText.bodyStrong.s15,
              ),
              // padding: MaterialStateProperty.resolveWith(
              //   (states) => widget.padding,
              // ),
              enableFeedback: true,
              foregroundColor: MaterialStateColor.resolveWith(
                (states) =>
                    isNullEmpty(onPressed) ? titleColor! : AppColors.white,
              ),
              overlayColor: MaterialStateColor.resolveWith(
                (states) => AppColors.white.withOpacity(0.1),
              ),
              splashFactory: null,
              elevation: MaterialStateProperty.resolveWith(
                (states) => 0.0,
              ),
              backgroundColor: MaterialStateColor.resolveWith(
                (states) {
                  if (isNullEmpty(onPressed) || !enable) {
                    return AppColors.grey0_5;
                  } else {
                    if(isOutlineButton) return AppColors.white;
                    if (loaded == LoadedType.start) {
                      return backgroundColor!.withOpacity(0.7);
                    } else {
                      return backgroundColor!;
                    }
                   }
                },
              ),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  side: isOutlineButton?  BorderSide( color: AppColors.orange  ): BorderSide.none,
                  borderRadius: BorderRadius.circular(AppDimens.radius_12),
                ),
              ),
            ),
            child: loaded == LoadedType.start
                ? const SizedBox.shrink()
                : Text(
                    title,
                    style: ThemeText.bodyStrong.s16.copyWith(
                      color: isOutlineButton? AppColors.orange : AppColors.white,
                     // fontSize: titleFontSize ?? AppDimens.s,
                    ),
                  ),
          ),
        ),
        loaded == LoadedType.start
            ? const JumpingDots(
          color: AppColors.grey3,
          animationDuration: Duration(milliseconds: 300),
          radius: 6,
          innerPadding: 3,
        )
            : const SizedBox.shrink()
      ],
    );
  }
}