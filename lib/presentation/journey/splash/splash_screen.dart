import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/utils/layout_extension.dart';
import 'package:login_sample_app/generated/assets.gen.dart';
import 'package:login_sample_app/presentation/journey/splash/splash_state_notifier.dart';
import 'package:login_sample_app/presentation/widgets/export.dart';

class SplashScreen extends ConsumerStatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);



  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with TickerProviderStateMixin, LayoutExtension
  {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context ) {
 //   WidgetsBinding.instance.addPostFrameCallback((_) {
     Future.delayed(const Duration(seconds: 2), () {
        debugPrint(DateTime.now().toIso8601String());
        ref.read(splashProvider.notifier).initialRoute();
      });

   // });
  //  final splashStateNotifier = ref.read(splashProvider.notifier);
    return Scaffold(
      body: Center(
        child: AppImageWidget(
          asset: Assets.images.png.imgTweetIcon,
          size: screenWidth /4,
        ),
      ),
    );
  }
}
