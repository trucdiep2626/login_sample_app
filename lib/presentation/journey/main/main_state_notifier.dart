import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/common/di/injector.dart';
import 'package:login_sample_app/domain/usecases/account_usecase.dart';
import 'package:login_sample_app/presentation/journey/main/main_state.dart';

final mainProvider = StateNotifierProvider<MainStateNotifier, MainState>(
    (ref) =>
        MainStateNotifier(ref: ref, accountUseCase: getIt<AccountUseCase>()));

class MainStateNotifier extends StateNotifier<MainState> {
  MainStateNotifier({
    required this.ref,
    required this.accountUseCase,
  }) : super(MainState());

  // Variable for Ref
  Ref ref;
  AccountUseCase accountUseCase;

  void onChangedNav(int index) {
    state = state.copyWith(currentIndex: index);
  }

  Future<void> logout() async {
    await accountUseCase.logout();
    NavigationService.routeToAndRemoveUntil(
        RouteGenerator.introduction, (route) => false);
  }
}
