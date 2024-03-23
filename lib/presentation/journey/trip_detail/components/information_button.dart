import 'package:flutter/material.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/presentation/theme/export.dart';

class InformationButton extends StatelessWidget {
  const InformationButton({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationService.routeTo(RouteGenerator.tripInformation),
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
          Icons.info_outlined,
          color: AppColors.blue,
          size: AppDimens.space_24,
        ),
      ),
    );
  }
}
