import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/language_state.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_delegate.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(LanguageState(currentLocale: FlutterDictionaryDelegate.getCurrentLocale));

  void updateLanguage() {
    emit(state.copyWith(FlutterDictionaryDelegate.getCurrentLocale));
  }
}
