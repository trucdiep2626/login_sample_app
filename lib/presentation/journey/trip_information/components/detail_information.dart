import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/presentation/journey/trip_detail/trip_detail_state_notifier.dart';
import 'package:login_sample_app/presentation/theme/export.dart';
import 'package:login_sample_app/presentation/widgets/app_bottom_sheet.dart';
import 'package:login_sample_app/presentation/widgets/app_text.dart';

class DetailInformation extends ConsumerWidget with LayoutExtension {
  const DetailInformation({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final state = ref.watch(tripDetailProvider);
    final stateNotifier = ref.read(tripDetailProvider.notifier);

    return AppBottomSheet(
      title: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDetailInformation(
            title: 'VISA',
            content: 'Vietnam Visa',
          ),
          _buildDetailInformation(
            title: 'VISA',
            content: 'Vietnam Visa',
          ),
          _buildDetailInformation(
            title: 'VISA',
            content: 'Vietnam Visa',
          ),
        ],
      ),
    );
  }

  Widget _buildDetailInformation(
      {required String title, required String content}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          style: ThemeText.bodyMedium.blue,
        ),
        SizedBox(
          height: AppDimens.space_8,
        ),
        AppText(
          content,
          style: ThemeText.bodyRegular,
        ),
        SizedBox(
          height: AppDimens.space_16,
        ),
      ],
    );
  }
}
