import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:login_sample_app/presentation/journey/main/main_state_notifier.dart';
import 'package:login_sample_app/presentation/widgets/app_appbar.dart';
import 'package:login_sample_app/presentation/widgets/app_touchable.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarWidget(
        title: L10n.current.profile,
      ),
      body: Center(
        child: AppTouchable(
          onPressed: () {
            ref.read(mainProvider.notifier).logout();
          },
          child: const Text('Logout'),
        ),
      ),
    );
  }
}
