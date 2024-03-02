import 'package:flutter/material.dart';
import 'package:login_sample_app/presentation/journey/login/login_screen.dart';
import 'package:login_sample_app/presentation/journey/main/main_screen.dart';
import 'package:login_sample_app/presentation/journey/splash/splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class RouteGenerator {
  /// All the route paths. So that we can access them easily  across the app
  static const login = 'login_screen';
  static const main = 'main_screen';
  static const splash = 'splash_screen';

  /// Private static methods to route to page with transition
  /// REQUIRE use function
  static PageTransition<dynamic> _pageTransition({
    RouteSettings? settings,
    required Widget child,
  }) {
    return PageTransition(
      settings: settings,
      child: child,
      duration: const Duration(milliseconds: 250),
      reverseDuration: const Duration(milliseconds: 250),
      type: PageTransitionType.rightToLeft,
    );
  }

  /// Function generate routes
  /// Arguments:
  /// * `settings`: The RouteSettings for the current route.
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return _pageTransition(
          settings: settings,
          child: const LoginScreen(),
        );
      case main:
        return _pageTransition(
          settings: settings,
          child: const MainScreen(),
        );
      case splash:
        return _pageTransition(
          settings: settings,
          child: const SplashScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('Not found ${settings.name}'),
            ),
          ),
        );
    }
  }
}
