import 'package:login_sample_app/common/common_export.dart';

class TripDetailState {
  final LoadedType tripDetailLoadedType;
  final int selectedIndex;
  final bool showFullInformation;

  TripDetailState({
    this.tripDetailLoadedType = LoadedType.finish,
    this.selectedIndex = -1,
    this.showFullInformation = false,
  });

  TripDetailState copyWith({
    LoadedType? tripDetailLoadedType,
    int? selectedIndex,
    bool? showFullInformation,
  }) {
    return TripDetailState(
      tripDetailLoadedType: tripDetailLoadedType ?? this.tripDetailLoadedType,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      showFullInformation: showFullInformation ?? this.showFullInformation,
    );
  }
}
