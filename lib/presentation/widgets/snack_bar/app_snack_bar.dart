import 'package:flutter/material.dart';
import 'package:login_sample_app/common/constants/app_dimens.dart';
import 'package:login_sample_app/common/constants/enums.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/app_text.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

import 'flash.dart';

void showTopSnackBar(
  BuildContext context, {
  SnackBarType type = SnackBarType.done,
  required String message,
}) {
  showFlash(
      context: context,
      duration: const Duration(seconds: 2),
      persistent: true,
      builder: (_, controller) {
        return Flash(
          controller: controller,
          backgroundColor: Colors.transparent,
          brightness: Brightness.light,
          barrierDismissible: true,
          behavior: FlashBehavior.floating,
          position: FlashPosition.top,
          child: AppSnackBarWidget(
            type: type,
            message: message,
          ),
        );
      });
}

showTopSnackBarError(BuildContext context, String message) {
  showTopSnackBar(
    context,
    message: message,
    type: SnackBarType.error,
  );
}

class AppSnackBarWidget extends StatelessWidget {
  final SnackBarType type;
  final String message;

  const AppSnackBarWidget({
    Key? key,
    this.type = SnackBarType.warning,
    required this.message,
  }) : super(key: key);

  IconData get icon {
    switch (type) {
      case SnackBarType.done:
        return Icons.done;
      case SnackBarType.error:
        return Icons.clear;
      default:
        return Icons.warning_amber;
    }
  }

  Color? get backgroundColor {
    switch (type) {
      case SnackBarType.done:
        return AppColors.green50;
      case SnackBarType.error:
        return AppColors.red50;
      default:
        return AppColors.orange50;
    }
  }

  Color? get textColor {
    switch (type) {
      case SnackBarType.done:
        return AppColors.green;
      case SnackBarType.error:
        return AppColors.red;
      default:
        return AppColors.orange;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: AppDimens.space_16),
      decoration: BoxDecoration(
          borderRadius:
              const BorderRadius.all(Radius.circular(AppDimens.radius_12)),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: backgroundColor!,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ]),
      padding: EdgeInsets.all(AppDimens.space_12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // AppImageWidget(
          //   asset: icon,
          //   width: AppDimens.space_20,
          //   height: AppDimens.space_20,
          //   color: textColor,
          // ),
          // SizedBox(
          //   width: AppDimens.space_12,
          // ),
          Expanded(
            child: AppText(
              message,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  ?.copyWith(color: textColor),
            ),
          )
        ],
      ),
    );
  }
}
