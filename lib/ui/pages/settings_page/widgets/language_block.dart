import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_events.dart';
import 'package:fridge_yellow_team_bloc/dictionary/data/en.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_delegate.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/dictionary/models/supported_locales.dart';
import 'package:fridge_yellow_team_bloc/res/app_fonts.dart';
import 'package:fridge_yellow_team_bloc/res/app_styles/app_colors.dart';
import 'package:provider/src/provider.dart';

class LanguageBlock extends StatefulWidget {
  LanguageBlock() : super(key: UniqueKey());

  @override
  _LanguageBlockState createState() => _LanguageBlockState();
}

class _LanguageBlockState extends State<LanguageBlock> {
  final SettingsPageLanguage _language = FlutterDictionary.instance.language?.settingsPageLanguage ?? en.settingsPageLanguage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Text(
              _language.language,
              style: AppFonts.mediumTextStyleBlackTwo,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            height: 40.0,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: SupportedLocales.instance.getSupportedLocales!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 24.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(10.0),
                  onTap: () {
                    // FlutterDictionary.instance.setNewLanguage(SupportedLocales.instance.getSupportedLocales![index].toString());
                    // context.read<LanguageCubit>().updateLanguage();
                    context.read<LanguageBloc>().add(ChangeLanguageEvent(newLanguage: SupportedLocales.instance.getSupportedLocales![index].toString()));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40.0,
                    width: 62.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(
                        color: SupportedLocales.instance.getSupportedLocales![index].toString() == FlutterDictionaryDelegate.getCurrentLocale
                            ? AppColors.marigold
                            : AppColors.black.withOpacity(0.2),
                      ),
                      color: SupportedLocales.instance.getSupportedLocales![index].toString() == FlutterDictionaryDelegate.getCurrentLocale
                          ? AppColors.wheat20.withOpacity(0.2)
                          : AppColors.transparent,
                    ),
                    child: Text(
                      '${SupportedLocales.instance.getSupportedLocales![index].toString().substring(0, 1).toUpperCase()}${SupportedLocales.instance.getSupportedLocales![index].toString().substring(1, 2)}',
                      style: AppFonts.medium16Height24TextStyle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
