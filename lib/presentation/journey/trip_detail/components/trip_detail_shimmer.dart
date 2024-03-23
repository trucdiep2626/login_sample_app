import 'package:flutter/material.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

class TripDetailShimmer extends StatelessWidget with LayoutExtension {
  const TripDetailShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildBackgroundShimmer(),
        _buildContentShimmer(),
      ],
    );
  }

  Widget _buildBackgroundShimmer() {
    return AppShimmer(
      width: screenWidth,
      height: screenHeight / 3,
    );
  }

  Widget _buildContentShimmer() {
    return Padding(
      padding: EdgeInsets.all(AppDimens.space_16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight / 6,
            ),
            AppShimmer(
              height: screenHeight / 3,
              width: double.infinity,
            ),
            SizedBox(
              height: AppDimens.space_16,
            ),
            ListView.builder(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => _buildInformationShimmer(),
              shrinkWrap: true,
              itemCount: 5,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInformationShimmer() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.space_8,
      ),
      child: Row(
        children: [
          AppShimmer(
            height: screenWidth / 7,
            width: screenWidth / 7,
            borderRadius: BorderRadius.circular(screenWidth / 7),
          ),
          SizedBox(
            width: AppDimens.space_16,
          ),
          Expanded(
            child: Column(
              children: [
                const AppShimmer(
                  width: double.infinity,
                ),
                SizedBox(
                  height: AppDimens.space_8,
                ),
                const AppShimmer(
                  width: double.infinity,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
