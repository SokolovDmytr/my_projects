class ScreenRecipePageState {
  final bool isFavourite;

  ScreenRecipePageState({
    required this.isFavourite,
  });

  ScreenRecipePageState copyWith({
    bool? isFavourite,
  }) {
    return ScreenRecipePageState(isFavourite: isFavourite ?? this.isFavourite);
  }
}
