class MainState {
  int currentIndex;

  MainState({
    this.currentIndex = 0,
  });

  MainState copyWith({
    int? currentIndex,
  }) {
    return MainState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
