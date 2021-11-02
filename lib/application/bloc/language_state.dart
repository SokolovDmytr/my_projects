class LanguageState {
  final String currentLocale;

  const LanguageState({
    required this.currentLocale,
  });

  LanguageState copyWith({
    String? currentLocale,
  }) {
    return LanguageState(
      currentLocale: currentLocale ?? this.currentLocale,
    );
  }
}
