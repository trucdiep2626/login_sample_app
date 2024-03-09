import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/common/di/injector.dart';
import 'package:login_sample_app/domain/usecases/account_usecase.dart';
import 'package:login_sample_app/presentation/journey/splash/splash_state.dart';

final splashProvider = StateNotifierProvider<SplashStateNotifier, SplashState>(
    (ref) =>
        SplashStateNotifier(ref: ref, accountUseCase: getIt<AccountUseCase>()));

class SplashStateNotifier extends StateNotifier<SplashState> {
  SplashStateNotifier({
    required this.ref,
    required this.accountUseCase,
  }) : super(SplashState()) {
    initialRoute();
  }

  // Variable for Ref
  Ref ref;
  AccountUseCase accountUseCase;

  Future<void> initialRoute() async {
    final token = await accountUseCase.getAccessToken();
    if (!isNullEmpty(token)) {
      DateTime? expireDate = Jwt.getExpiryDate(token!);
      if (expireDate != null && expireDate.isAfter(DateTime.now())) {
        NavigationService.routeToAndRemoveUntil(
            RouteGenerator.main, (route) => false);
      }
    } else {
      NavigationService.routeToAndRemoveUntil(
          RouteGenerator.introduction, (route) => false);
    }
  }
}
