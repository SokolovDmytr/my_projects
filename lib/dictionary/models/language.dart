import 'package:memes/dictionary/dictionary_classes/catalog_page.dart';
import 'package:memes/dictionary/dictionary_classes/create_meme_page_language.dart';
import 'package:memes/dictionary/dictionary_classes/snack_bars_language.dart';

class Language {
  final CatalogPageLanguage catalogPageLanguage;
  final CreateMemePageLanguage createMemePageLanguage;
  final SnackBarsLanguage snackBarsLanguage;

  const Language({
    required this.catalogPageLanguage,
    required this.createMemePageLanguage,
    required this.snackBarsLanguage,
  });
}
