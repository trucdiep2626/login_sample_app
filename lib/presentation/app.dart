import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/common/di/injector.dart';
import 'package:login_sample_app/domain/usecases/account_usecase.dart';
import 'package:login_sample_app/l10n/l10n.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:stack_trace/stack_trace.dart' as stack_trace;

Future<void> setupAndRunApp() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Initializing the Hive database.
  // await HiveServices.init();

  /// Checking the network status and setting the network status provider.
  // await NetworkStatus.init();
  runApp(const ProviderScope(
    child: App(),
  ));
  FlutterError.demangleStackTrace = (StackTrace stack) {
    if (stack is stack_trace.Trace) return stack.vmTrace;
    if (stack is stack_trace.Chain) return stack.toTrace().vmTrace;
    return stack;
  };
}

class App extends ConsumerWidget {
  const App({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Listen and initial session provider when start new session

    // // Checking if the user is logged in or not.
    //  final isLoggedIn = true;

    // // Checking if the user is regist or not.
    //   final isRegistered = AuthLocal.isRegistered;

    // // This is a flag to check if the user is using the app for the first time.
    //final theFirstTime = HiveServices.firstTimeUseApp;

    // Setup status bar color
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: () {
          return MaterialApp(
            title: 'Login Sample App',
            debugShowCheckedModeBanner: false,
            initialRoute: RouteGenerator.splash,
            onGenerateRoute: RouteGenerator.generateRoutes,
            navigatorKey: NavigationService.navigatorKey,
            //   scaffoldMessengerKey: CommonSnackBar.snackBarKey,
            locale: const Locale('en', 'US'),
            localizationsDelegates: const [
              L10n.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: L10n.delegate.supportedLocales,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                  textScaleFactor: 1.0,
                  devicePixelRatio: 1.0,
                ),
                child: GestureDetector(
                  onTap: () {
                    // Dismiss keyboard when tap outside whole app
                    WidgetsBinding.instance.focusManager.primaryFocus
                        ?.unfocus();
                  },
                  child: child,
                ),
              );
            },
          );
        });
  }
}
