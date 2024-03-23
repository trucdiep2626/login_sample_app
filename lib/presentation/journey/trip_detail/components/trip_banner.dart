import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/generated/assets.gen.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

class TripBanner extends ConsumerWidget with LayoutExtension {
  const TripBanner({Key? key}) : super(key: key);

  // TODO(dieptt): mock data

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return

        //   Center(
        //     child: AppShimmer(
        //       height: AppDimens.space_140,
        //       width: screenWidth - AppDimens.space_16 * 2,
        //     ),
        //   )
        //       :
        // controller.banners.length == 0
        //       ? SizedBox.shrink()
        //       :
        CarouselSlider.builder(
      options: CarouselOptions(
        autoPlay: true,
        aspectRatio: 2.5,
        viewportFraction: 1,
        enlargeCenterPage: true,
      ),
      itemCount: 3,
      itemBuilder: (cxt, index, i) {
        final imageUrl = Assets.images.jpg.imgLogin;

        return AppImageWidget(
          borderRadius: BorderRadius.circular(
            AppDimens.radius_12,
          ),
          asset: imageUrl,
          width: screenWidth - AppDimens.space_16 * 2,
          fit: BoxFit.cover,
          //height: height,
        );
      },
    );
  }
}
