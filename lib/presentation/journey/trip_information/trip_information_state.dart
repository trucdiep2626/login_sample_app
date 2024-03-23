import 'package:login_sample_app/common/common_export.dart';

class TripInformationState {
  final LoadedType tripInformationLoadedType;

  TripInformationState({
    this.tripInformationLoadedType = LoadedType.finish,
  });

  TripInformationState copyWith({
    LoadedType? tripInformationLoadedType,
    int? selectedIndex,
  }) {
    return TripInformationState(
      tripInformationLoadedType:
          tripInformationLoadedType ?? this.tripInformationLoadedType,
    );
  }
}
