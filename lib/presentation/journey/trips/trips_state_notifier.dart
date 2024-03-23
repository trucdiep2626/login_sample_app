import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_sample_app/common/common_export.dart';
import 'package:login_sample_app/common/di/injector.dart';
import 'package:login_sample_app/domain/usecases/account_usecase.dart';
import 'package:login_sample_app/presentation/journey/trips/trips_state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

final tripsProvider = StateNotifierProvider.autoDispose<
    TripsStateNotifier, TripsState>(
        (ref) => TripsStateNotifier(
        ref: ref, accountUseCase: getIt<AccountUseCase>()));

class TripsStateNotifier
    extends StateNotifier<TripsState> {
  TripsStateNotifier({
    required this.ref,
    required this.accountUseCase,
  }) : super(TripsState())  ;


  // Variable for Ref
  Ref ref;
  AccountUseCase accountUseCase;
  final RefreshController refreshController = RefreshController();



  Future<void> getAllTrips( ) async {
  state = state.copyWith(tripsLoadedType: LoadedType.start);

    try {
    await  Future.delayed(Duration(seconds: 2));
      // final result = await accountUseCase.sendSignUpCode(
      //     sendSignUpCodeRequest: state.sendSignUpCodeRequest!);
      //
      // if (result != null && ((result.meta?.status ?? 0) == 200)) {
      //
      // }
    } on ApiExceptions catch (e) {


    } finally {
      state = state.copyWith(tripsLoadedType: LoadedType.finish);
      refreshController.refreshCompleted();
      refreshController.loadComplete();
    }
  }
}
