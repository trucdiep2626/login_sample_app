import 'package:flutter/material.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/app_text.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

void showAppBottomSheet(BuildContext context, {required Widget child}) {
  showModalBottomSheet(
    isScrollControlled: true,
    shape: ShapeBorder.lerp(
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimens.radius_16),
          topRight: Radius.circular(AppDimens.radius_16),
        ),
      ),
      const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimens.radius_16),
          topRight: Radius.circular(AppDimens.radius_16),
        ),
      ),
      1,
    ),
    context: context,
    builder: (context) => child,
  );
}

class AppBottomSheet extends StatelessWidget with LayoutExtension {
  const AppBottomSheet({
    super.key,
    required this.child,
    this.title,
  });

  final Widget child;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.9,
      padding: EdgeInsets.all(
        AppDimens.space_16,
      ),
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimens.radius_16),
          topRight: Radius.circular(AppDimens.radius_16),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                if (title != null)
                  Expanded(
                    child: AppText(
                      title ?? '',
                      style: ThemeText.bodyMedium.s16.grey4,
                    ),
                  ),
                AppTouchable(
                  alignment: Alignment.topRight,
                  onPressed: () => NavigationService.goBack(),
                  child: const Icon(
                    Icons.clear,
                    color: AppColors.grey3,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: AppDimens.space_16,
            ),
            child,
          ],
        ),
      ),
    );
  }
}
