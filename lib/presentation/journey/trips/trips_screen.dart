import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:login_sample_app/presentation/journey/trips/components/trip_item.dart';
import 'package:login_sample_app/presentation/journey/trips/trips_state_notifier.dart';
import 'package:login_sample_app/presentation/theme/theme_text.dart';
import 'package:login_sample_app/presentation/widgets/app_appbar.dart';
import 'package:login_sample_app/presentation/widgets/app_text.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

class TripsScreen extends ConsumerStatefulWidget {
  const TripsScreen({super.key});

  @override
  ConsumerState<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends ConsumerState<TripsScreen>
    with TickerProviderStateMixin, LayoutExtension {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(tripsProvider);
    final stateNotifier = ref.read(tripsProvider.notifier);

    return Scaffold(
      appBar: AppBarWidget(title: L10n.current.trips),
      body: AppRefreshWidget(
        onRefresh: () => stateNotifier.getAllTrips(),
        controller: stateNotifier.refreshController,
        child: Padding(
          padding: EdgeInsets.all(AppDimens.space_16),
          child: state.tripsLoadedType == LoadedType.start
              ? _buildShimmer()
              : ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return TripItem();
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(height: AppDimens.space_16);
                  },
                  itemCount: 10,
          ),
        ),
      ),
    );
  }

  Widget _buildShimmer() {
    return ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return TripItemShimmer();
        },
        separatorBuilder: (context, index) {
          return SizedBox(height: AppDimens.space_16);
        },
        itemCount: 5);
  }
}
