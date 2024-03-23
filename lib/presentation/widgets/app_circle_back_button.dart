import 'package:flutter/material.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/presentation/theme/export.dart';

class AppCircleBackButton extends StatelessWidget {
  const AppCircleBackButton({
    super.key,
    this.onPressed,
  });

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () => NavigationService.goBack(),
      child: Container(
        decoration:   BoxDecoration(
          color: Colors.white.withOpacity(0.9),
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 1),
              color: Colors.black12,
              blurRadius: 10,
            )
          ],
        ),
        padding: EdgeInsets.all(AppDimens.space_8),
        child: Icon(
          Icons.arrow_back_ios_rounded,
          color: AppColors.blue,
          size: AppDimens.space_24,
        ),
      ),
    );
  }
}
