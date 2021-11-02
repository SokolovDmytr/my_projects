abstract class LanguageEvent {}

class ChangeLanguageEvent extends LanguageEvent {
  final String newLanguage;

  ChangeLanguageEvent({
    required this.newLanguage,
  });
}
