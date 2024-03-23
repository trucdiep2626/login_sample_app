import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/generated/assets.gen.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:login_sample_app/presentation/journey/trip_detail/components/detail_itinerary_widget.dart';
import 'package:login_sample_app/presentation/journey/trip_detail/components/information_button.dart';
import 'package:login_sample_app/presentation/journey/trip_detail/components/trip_detail_shimmer.dart';
import 'package:login_sample_app/presentation/journey/trip_detail/trip_detail_state_notifier.dart';
import 'package:login_sample_app/presentation/journey/trips/components/trip_item.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/app_circle_back_button.dart';
import 'package:login_sample_app/presentation/widgets/app_text.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

class TripDetailArguments {
  TripDetailArguments();
}

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: TripDetailBody(),
    );
  }
}

class TripDetailBody extends ConsumerStatefulWidget {
  const TripDetailBody({super.key});

  @override
  ConsumerState<TripDetailBody> createState() => _TripDetailBodyState();
}

class _TripDetailBodyState extends ConsumerState<TripDetailBody>
    with TickerProviderStateMixin, LayoutExtension {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //  final arg = ModalRoute.of(context)?.settings.arguments;
      // if (arg is TripDetailArguments) {
      ref.read(tripDetailProvider.notifier).getTripDetail();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(tripDetailProvider);
    final stateNotifier = ref.read(tripDetailProvider.notifier);

    return AppRefreshWidget(
      onRefresh: () => stateNotifier.getTripDetail(),
      controller: stateNotifier.refreshController,
      child: state.tripDetailLoadedType == LoadedType.start
          ? TripDetailShimmer()
          : SingleChildScrollView(
              child: Stack(
                children: [
                  _buildBackground(),
                  _buildContent(),
                ],
              ),
            ),
    );
  }

  Widget _buildContent() {
    return SafeArea(
      child: SizedBox(
        width: screenWidth,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.space_16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  AppCircleBackButton(),
                  Spacer(),
                  InformationButton(),
                ],
              ),
              SizedBox(
                height: screenHeight / 6,
              ),
              _buildGeneralTripInformation(),
              SizedBox(
                height: AppDimens.space_16,
              ),
              _buildTripDestinationList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTripDestinationList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => _buildTripDetailLine(index),
      itemCount: 15,
      shrinkWrap: true,
    );
  }

  Widget _buildTripDetailLine(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppDimens.space_8),
      child: GestureDetector(
        onTap: () {
          ref.read(tripDetailProvider.notifier).onSelectedIndex(index);
          showAppBottomSheet(context, child: DetailItinerary());
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.zero,
              height: screenWidth / 7,
              width: screenWidth / 7,
              decoration: const BoxDecoration(
                color: AppColors.blue,
                shape: BoxShape.circle,
              ),
              alignment: Alignment.center,
              child: AppText(
                'Day ${index + 1}',
                style: ThemeText.bodySemibold.s12.white,
              ),
            ),
            SizedBox(
              width: AppDimens.space_16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Sunday, 03 Mar 2024',
                    style: ThemeText.bodyMedium.s13.blue.italic,
                  ),
                  AppText(
                    'Ha Long Bay Ha Long Bay Ha Long Bay Ha Long Bay Ha Long Bay Ha Long Bay Ha Long Bay ',
                    style: ThemeText.bodyMedium.s16,
                    maxLines: 1,
                    minFontSize: AppDimens.space_16,
                    textOverflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.grey3,
              size: AppDimens.space_16,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGeneralTripInformation() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppDimens.space_16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppDimens.radius_16),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey3.withOpacity(0.2),
            offset: const Offset(0, 4),
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppText(
            'DISCOVER VIETNAM TOUR DISCOVER VIETNAM TOUR ',
            style: ThemeText.bodySemibold.s24,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 0),
            child: Divider(
              color: AppColors.grey0_5,
            ),
          ),
          _buildInformationTrip(
            title: '${L10n.current.booking_ref}: 123456',
            icon: Icons.numbers_rounded,
          ),
          _buildInformationTrip(
            title: '${L10n.current.duration}: 14 days',
            icon: Icons.access_time_rounded,
          ),
          _buildInformationTrip(
            title: '03/03/2024 - 17/03/2024',
            icon: Icons.calendar_month_outlined,
          ),
          _buildInformationTrip(
            title: L10n.current.view_travel_voucher,
            icon: Icons.discount_outlined,
            trailingIcon: Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }

  Widget _buildInformationTrip({
    required String title,
    required IconData icon,
    IconData? trailingIcon,
    String? trailingText,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppDimens.space_8),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.blue600,
              size: AppDimens.space_20,
            ),
            SizedBox(
              width: AppDimens.space_8,
            ),
            Expanded(
              child: AppText(
                title,
                style: ThemeText.bodyRegular.grey3,
              ),
            ),
            if (trailingIcon != null)
              Icon(
                trailingIcon,
                size: AppDimens.space_16,
                color: AppColors.grey3,
              ),
            if (trailingText != null)
              AppText(
                trailingText,
                style: ThemeText.bodyRegular.s16,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return AppImageWidget(
      asset: Assets.images.jpg.imgLogin,
      fit: BoxFit.cover,
      width: screenWidth,
      height: screenHeight / 3,
    );
  }
}
