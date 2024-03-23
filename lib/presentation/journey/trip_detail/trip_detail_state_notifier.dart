import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/common/di/injector.dart';
import 'package:login_sample_app/domain/usecases/account_usecase.dart';
import 'package:login_sample_app/presentation/journey/trip_detail/trip_detail_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final tripDetailProvider =
    StateNotifierProvider.autoDispose<TripDetailStateNotifier, TripDetailState>(
        (ref) => TripDetailStateNotifier(
            ref: ref, accountUseCase: getIt<AccountUseCase>()));

class TripDetailStateNotifier extends StateNotifier<TripDetailState> {
  TripDetailStateNotifier({
    required this.ref,
    required this.accountUseCase,
  }) : super(TripDetailState());

  // Variable for Ref
  Ref ref;
  AccountUseCase accountUseCase;
  final RefreshController refreshController = RefreshController();

  void onSelectedIndex(int index) {
    state = state.copyWith(
      selectedIndex: index,
      showFullInformation: false,
    );
  }

  void onShowFullInformation() {
    state = state.copyWith(showFullInformation: !state.showFullInformation);
  }

  Future<void> getTripDetail() async {
    state = state.copyWith(tripDetailLoadedType: LoadedType.start);

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
      state = state.copyWith(tripDetailLoadedType: LoadedType.finish);
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    }
  }
}
