import 'package:flutter/material.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/generated/assets.gen.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

class IntroductionScreen extends StatelessWidget with LayoutExtension {
  const IntroductionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildBanner(),
            _buildBody(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(context),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.space_32),
      child: Column(
        children: [
          SizedBox(
            height: AppDimens.space_68,
          ),
          AppButton(
            title: L10n.current.passenger,
            icon: Assets.images.svg.icPersonCircle,
            fontWeight: FontWeight.w500,
            titleFontSize: AppDimens.space_15,
            onPressed: () => NavigationService.routeTo(
              RouteGenerator.login,
              arguments: UserType.passenger,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: AppDimens.space_16),
            child: Text(
              L10n.current.sign_in_with,
              style: ThemeText.bodyRegular.s15.grey3,
            ),
          ),
          AppButton(
            title: L10n.current.tour_guide,
            icon: Assets.images.svg.icPerson,
            fontWeight: FontWeight.w500,
            titleFontSize: AppDimens.space_15,
            isOutlineButton: true,
            onPressed: () => NavigationService.routeTo(
              RouteGenerator.login,
              arguments: UserType.tourGuide,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNav(BuildContext context) {
    return SizedBox(
      // color: AppColors.purple,
      height: AppDimens.space_43 + MediaQuery.of(context).padding.bottom,
      child: Column(
        children: [
          Text(
            L10n.current.need_help,
            style: ThemeText.bodyRegular.s14.grey3,
          ),
          SizedBox(
            height: AppDimens.space_8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.phone_in_talk,
                color: AppColors.blue,
                size: AppDimens.space_18,
              ),
              SizedBox(
                width: AppDimens.space_4,
              ),
              Text(
                Constants.phoneNumber,
                style: ThemeText.bodyRegular.s12.blue,
              ),
              SizedBox(
                width: AppDimens.space_8,
              ),
              Text(
                L10n.current.or,
                style: ThemeText.bodyRegular.s12,
              ),
              SizedBox(
                width: AppDimens.space_8,
              ),
              Icon(
                Icons.phone_in_talk,
                color: AppColors.blue,
                size: AppDimens.space_18,
              ),
              SizedBox(
                width: AppDimens.space_4,
              ),
              Text(
                Constants.phoneNumber2,
                style: ThemeText.bodyRegular.s12.blue,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBanner() {
    return SizedBox(
      height: screenWidth,
      width: screenWidth,
      child: Stack(
        children: [
          AppImageWidget(
            asset: Assets.images.jpg.imgLogin,
            fit: BoxFit.cover,
            height: screenWidth,
            width: screenWidth,
          ),
          Container(
            height: screenWidth,
            width: screenWidth,
            color: AppColors.black.withOpacity(0.6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppImageWidget(
                  size: AppDimens.space_84,
                  asset: Assets.images.png.imgTweetIcon,
                ),
                SizedBox(
                  height: AppDimens.space_20,
                ),
                Text(
                  L10n.current.tweet_trip,
                  style: ThemeText.bodyStrong.s30.white,
                ),
                SizedBox(
                  height: AppDimens.space_12,
                ),
                Text(
                  L10n.current.tweet_trip_message,
                  style: ThemeText.bodyRegular.s16.white,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
