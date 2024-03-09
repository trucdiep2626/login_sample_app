import 'package:flutter/material.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/app_touchable.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final String? title;
  final List<Widget>? actions;
  final Function()? onTapBack;
  final bool isShowSupport;

  const AppBarWidget({
    super.key,
    this.showBackButton = false,
    this.title,
    this.actions,
    this.onTapBack,
    this.isShowSupport = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: AppColors.white,
      automaticallyImplyLeading: showBackButton,
      leadingWidth: !showBackButton ? 0 : AppDimens.space_36,
      leading: showBackButton
          ? AppTouchable(
              onPressed: () => NavigationService.goBack(),
              child: const Icon(
                Icons.arrow_back_ios_new,
                color: AppColors.grey3,
              ))
          : const SizedBox.shrink(),
      title: title == null
          ? const SizedBox.shrink()
          : Text(
              title!,
              style: ThemeText.bodyStrong.s20.grey3,
            ),
      centerTitle: false,
      actions: isShowSupport ? [] : actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppDimens.height_60);
}
