import 'package:memes/dictionary/dictionary_classes/catalog_page.dart';
import 'package:memes/dictionary/dictionary_classes/create_meme_page_language.dart';
import 'package:memes/dictionary/dictionary_classes/snack_bars_language.dart';
import 'package:memes/dictionary/models/language.dart';

const Language en = Language(
  catalogPageLanguage: CatalogPageLanguage(
    memesTemplates: 'Memes templates',
    searchField: 'Search for meme templates',
    notFound: 'No memes templates are found',
  ),
  createMemePageLanguage: CreateMemePageLanguage(
    fontField: 'Font size',
    textField: 'Text field',
    mainColor: ' main color',
    outlineColor: 'outline color',
  ),
  snackBarsLanguage: SnackBarsLanguage(
    noInternet: 'No internet connection',
    saved: 'Your meme was successfully saved',
    serverError: 'Server error'
  ),
);
