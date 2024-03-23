import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/generated/assets.gen.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:login_sample_app/presentation/journey/trip_detail/trip_detail_state_notifier.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/app_bottom_sheet.dart';
import 'package:login_sample_app/presentation/widgets/app_image_widget.dart';
import 'package:login_sample_app/presentation/widgets/app_text.dart';
import 'package:login_sample_app/presentation/widgets/app_touchable.dart';

class DetailItinerary extends ConsumerWidget with LayoutExtension {
  const DetailItinerary({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final state = ref.watch(tripDetailProvider);
    final stateNotifier = ref.read(tripDetailProvider.notifier);

    return AppBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: AppDimens.space_36,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      stateNotifier.onSelectedIndex(index);
                    },
                    child: _buildDateItem(
                      index: index,
                      isSelected: state.selectedIndex == index,
                    ))),
          ),
          SizedBox(
            height: AppDimens.space_16,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      'Sunday, 03 Mar 2024',
                      style: ThemeText.bodyMedium.s13.blue.italic,
                    ),
                    AppText(
                      'Ha Long Bay Ha Long Bay Ha Long Bay Ha Long Bay Ha Long Bay Ha Long Bay Ha Long Bay Ha Long Bay Ha Long Bay Ha Long Bay ',
                      style: ThemeText.bodySemibold.s24.blue,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: AppDimens.space_16,
          ),
          _buildTourDetailInformation(
            title: L10n.current.transfer,
            content: Column(
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Transfer via: ',
                      style: ThemeText.bodyMedium,
                      children: [
                        TextSpan(text: 'Car', style: ThemeText.bodyRegular),
                      ]),
                ),
              ],
            ),
            icon: Assets.images.svg.icFlight,
          ),
          _buildTourDetailInformation(
            title: L10n.current.pick_up,
            content: Column(
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Transfer via: ',
                    style: ThemeText.bodyMedium,
                    children: [
                      TextSpan(
                          text: 'Private Car', style: ThemeText.bodyRegular),
                    ],
                  ),
                ),
              ],
            ),
            icon: Assets.images.svg.pickup,
          ),
          _buildTourDetailInformation(
            title: L10n.current.accomodation,
            content: AppText(
              '4-Star Hotel in Ha Long Bay',
              style: ThemeText.bodyMedium.s14,
            ),
            icon: Assets.images.svg.icHotel,
          ),
          _buildTourDetailInformation(
            title: L10n.current.tour_guide_information,
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  'ABC DCG',
                  style: ThemeText.bodyMedium.s14,
                ),
                AppText(
                  'abc@tweetworldtravel.com',
                  style: ThemeText.bodyRegular.s12,
                ),
                SizedBox(
                  height: AppDimens.space_4,
                ),
                AppText(
                  L10n.current.chat_with_tour_guide_now,
                  style: ThemeText.bodyRegular.s10.underline,
                ),
              ],
            ),
            icon: Assets.images.svg.icGuide,
          ),
          SizedBox(
            height: AppDimens.space_16,
          ),
          state.showFullInformation
              ? AppText(
                  'Tai Chi class on deck.Included excursion: visit of one of the largest caves of the bay.We\'ll cruise in Halong Bay.We’ll watch a traditional water puppetry show.Disembarking and trip back to Hanoi. Night at the hotel. Your cruise in the cabin category of your choice - double-occupancy accommodations in a first-class hotel - all meals - onboard drinks included (except for drinks from our special lists)'
                  ' - drinks at all meals in siem Reap (1 soft drink or 1 beer* or 1 mineral water + 1 tea or coffee per person for each meal) - visits and excursions mentioned in the program - the services of an English-speaking local tour guides and onboard CroisiEurope tour director - the Croisieurope agent in Siem Reap - travel assistance and repatriation insurance - tips.'
                  ' Tips: To ensure our customers more pleasant stay, we\'ve included 35¤ per passenger for tips which will be entirely paid to the personnel from the countries to be visited and 45¤ per passenger for crew members. This amount was determined while taking into consideration the local customs and etiquette.',
                  style: ThemeText.bodyRegular,
                )
              : AppTouchable(
                  onPressed: () => stateNotifier.onShowFullInformation(),
                  backgroundColor: AppColors.blue100,
                  alignment: Alignment.center,
                  padding: EdgeInsets.symmetric(
                    vertical: AppDimens.space_8,
                    horizontal: AppDimens.space_12,
                  ),
                  child: AppText(L10n.current.view_more_details,
                      style: ThemeText.bodyMedium.s12.blue800)),
        ],
      ),
    );
  }

  Widget _buildTourDetailInformation({
    required String title,
    required Widget content,
    required SvgGenImage icon,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          style: ThemeText.bodyMedium.orange6,
        ),
        Padding(
          padding: EdgeInsets.all(AppDimens.space_16),
          child: Row(
            children: [
              AppImageWidget(
                asset: icon,
                size: AppDimens.space_36,
              ),
              SizedBox(
                width: AppDimens.space_16,
              ),
              content,
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildDateItem({
    required int index,
    bool isSelected = false,
  }) {
    return Container(
      //  height: screenWidth / 7,
      width: screenWidth / 5,
      padding: EdgeInsets.symmetric(
        vertical: AppDimens.space_4,
        horizontal: AppDimens.space_8,
      ),
      decoration: BoxDecoration(
          color: isSelected ? AppColors.blue700 : AppColors.white,
          borderRadius: BorderRadius.circular(AppDimens.radius_16)),
      alignment: Alignment.center,
      child: AppText(
        'Day ${index + 1}',
        style: ThemeText.bodySemibold.s14.copyWith(
          color: isSelected ? AppColors.white : AppColors.grey4,
        ),
      ),
    );
  }
}
