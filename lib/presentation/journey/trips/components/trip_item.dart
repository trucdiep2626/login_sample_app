import 'package:flutter/material.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/generated/assets.gen.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/app_shimmer.dart';
import 'package:login_sample_app/presentation/widgets/app_text.dart';

class TripItem extends StatelessWidget with LayoutExtension {
  const TripItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => NavigationService.routeTo(RouteGenerator.tripDetail),
      child: Container(
        height: screenWidth * 0.7,
        width: screenWidth,

        decoration: BoxDecoration(
          // color: Colors.red,
          image: DecorationImage(
            image: AssetImage(
              Assets.images.jpg.imgLogin.path,
            ),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(AppDimens.radius_8),
        ),
        //    color: Colors.red,
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.all(AppDimens.space_16),
                padding: EdgeInsets.all(
                  AppDimens.space_6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppDimens.radius_30),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.access_time_outlined,
                      color: AppColors.blue,
                    ),
                    SizedBox(
                      width: AppDimens.space_4,
                    ),
                    AppText(
                      '14 days',
                      style: ThemeText.bodyRegular,
                      maxFontSize: AppDimens.space_12,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: screenWidth,
                height: screenWidth * 0.7 / 2,
                decoration: BoxDecoration(
                  color: AppColors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(AppDimens.radius_8),
                ),
                padding: EdgeInsets.all(AppDimens.space_12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'DISCOVER VIETNAM TOUR DISCOVER VIETNAM TOUR DISCOVER VIETNAM TOUR DISCOVER VIETNAM TOUR DISCOVER VIETNAM TOUR DISCOVER VIETNAM TOUR DISCOVER VIETNAM TOUR',
                      style: ThemeText.bodySemibold.white.s16,
                      maxLines: 2,
                      minFontSize: AppDimens.space_16,
                      textOverflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: AppDimens.space_8,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_rounded,
                          color: AppColors.white,
                          size: AppDimens.space_16,
                        ),
                        SizedBox(
                          width: AppDimens.space_4,
                        ),
                        AppText(
                          'Departure: 20/10/2021',
                          style: ThemeText.bodyRegular.white,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimens.space_8,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppDimens.space_6,
                        vertical: AppDimens.space_4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius:
                            BorderRadius.circular(AppDimens.radius_30),
                      ),
                      child: AppText(
                        L10n.current.on_the_trip,
                        style: ThemeText.bodyRegular.white,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TripItemShimmer extends StatelessWidget with LayoutExtension {
  const TripItemShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return AppShimmer(
      height: screenWidth * 0.7,
      width: screenWidth,
    );
  }
}
