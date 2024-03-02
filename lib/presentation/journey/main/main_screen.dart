import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/presentation/journey/main/main_state_notifier.dart';
import 'package:login_sample_app/presentation/theme/export.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Main Screen',
                style: ThemeText.bodySemibold.s24.title,
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => ref.read(mainProvider.notifier).logout(),
                child: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
