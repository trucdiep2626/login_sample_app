import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/common/di/injector.dart';
import 'package:login_sample_app/domain/usecases/account_usecase.dart';
import 'package:login_sample_app/presentation/journey/trip_information/trip_information_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final tripInformationProvider = StateNotifierProvider.autoDispose<
        TripInformationStateNotifier, TripInformationState>(
    (ref) => TripInformationStateNotifier(
        ref: ref, accountUseCase: getIt<AccountUseCase>()));

class TripInformationStateNotifier extends StateNotifier<TripInformationState> {
  TripInformationStateNotifier({
    required this.ref,
    required this.accountUseCase,
  }) : super(TripInformationState());

  // Variable for Ref
  Ref ref;
  AccountUseCase accountUseCase;
  final RefreshController refreshController = RefreshController();

  void onSelectedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }

  Future<void> getTripInformation() async {
    state = state.copyWith(tripInformationLoadedType: LoadedType.start);

    try {
      await Future.delayed(const Duration(seconds: 2));
      // final result = await accountUseCase.sendSignUpCode(
      //     sendSignUpCodeRequest: state.sendSignUpCodeRequest!);
      //
      // if (result != null && ((result.meta?.status ?? 0) == 200)) {
      //
      // }
    } on ApiExceptions catch (e) {
    } finally {
      state = state.copyWith(tripInformationLoadedType: LoadedType.finish);
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    }
  }
}
