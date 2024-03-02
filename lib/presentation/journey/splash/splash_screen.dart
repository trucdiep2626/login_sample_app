import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/presentation/journey/splash/splash_state_notifier.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final splashStateNotifier = ref.read(splashProvider.notifier);
    return Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
