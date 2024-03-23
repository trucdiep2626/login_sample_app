import 'package:login_sample_app/common/common_export.dart';

class TripsState{
  final LoadedType tripsLoadedType;

  TripsState({
    this.tripsLoadedType = LoadedType.finish,
  });

  TripsState copyWith({
    LoadedType? tripsLoadedType,
  }) {
    return TripsState(
      tripsLoadedType: tripsLoadedType ?? this.tripsLoadedType,
    );
  }
}