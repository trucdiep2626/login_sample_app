import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:login_sample_app/presentation/journey/trip_information/components/detail_information.dart';
import 'package:login_sample_app/presentation/journey/trip_information/trip_information_state_notifier.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

class TripInformationArguments {
  TripInformationArguments();
}

class TripInformationScreen extends StatelessWidget {
  const TripInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: L10n.current.trip_information,
        showBackButton: true,
      ),
      backgroundColor: AppColors.white,
      body: const TripInformationBody(),
    );
  }
}

class TripInformationBody extends ConsumerStatefulWidget {
  const TripInformationBody({super.key});

  @override
  ConsumerState<TripInformationBody> createState() =>
      _TripInformationBodyState();
}

class _TripInformationBodyState extends ConsumerState<TripInformationBody>
    with TickerProviderStateMixin, LayoutExtension {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //  final arg = ModalRoute.of(context)?.settings.arguments;
      // if (arg is TripInformationArguments) {
      ref.read(tripInformationProvider.notifier).getTripInformation();
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(tripInformationProvider);
    final stateNotifier = ref.read(tripInformationProvider.notifier);

    return AppRefreshWidget(
      onRefresh: () => stateNotifier.getTripInformation(),
      controller: stateNotifier.refreshController,
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildInformationTrip(
              title: L10n.current.trip_inclusions,
              icon: Icons.add_shopping_cart_rounded,
            ),
            _buildInformationTrip(
              title: L10n.current.tipping_guidelines,
              icon: Icons.attach_money_rounded,
            ),
            _buildInformationTrip(
              title: L10n.current.local_assistance_travel_guidance,
              icon: Icons.headset_mic_outlined,
            ),
            _buildInformationTrip(
              title: L10n.current.emergency_contact,
              icon: Icons.sos_rounded,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInformationTrip({
    required String title,
    required IconData icon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: () =>
          showAppBottomSheet(context, child: DetailInformation(title: title)),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.blue600,
          size: AppDimens.space_24,
        ),
        title: AppText(
          title,
          style: ThemeText.bodyRegular.s16.grey3,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: AppDimens.space_16,
          color: AppColors.grey3,
        ),
      ),
      //  )

      // Padding(
      //   padding: EdgeInsets.symmetric(vertical: AppDimens.space_8),
      //   child: Row(
      //     children: [
      //       Icon(
      //         icon,
      //         color: AppColors.blue600,
      //         size: AppDimens.space_20,
      //       ),
      //       SizedBox(
      //         width: AppDimens.space_8,
      //       ),
      //       Expanded(
      //         child: AppText(
      //           title,
      //           style: ThemeText.bodyRegular.s16.grey3,
      //         ),
      //       ),
      //       if (trailingIcon != null)
      //         Icon(
      //           Icons.arrow_forward_ios,
      //           size: AppDimens.space_16,
      //           color: AppColors.grey3,
      //         ),
      //     ],
      //   ),
      // ),
    );
  }
}
