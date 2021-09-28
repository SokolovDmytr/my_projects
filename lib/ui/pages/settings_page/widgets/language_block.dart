import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:yellow_team_fridge/application/application_vm.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_delegate.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/dictionary/models/supported_locales.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';

class LanguageBlock extends StatefulWidget {
  LanguageBlock() : super(key: Key('LanguageBlock'));

  @override
  _LanguageBlockState createState() => _LanguageBlockState();
}

class _LanguageBlockState extends State<LanguageBlock> {
  @override
  Widget build(BuildContext context) {
    final SettingsPageLanguage _language =
        FlutterDictionary.instance.language?.settingsPageLanguage ?? en.settingsPageLanguage;
    return StoreConnector(
      converter: ApplicationViewModel.init,
      builder: (BuildContext context, ApplicationViewModel vm) => Padding(
        padding: const EdgeInsets.only(bottom: 30.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                _language.language,
                style: AppFonts.mediumTextStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              height: 40.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: SupportedLocales.instance.getSupportedLocales.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: InkWell(
                    onTap: () {
                      vm.setLanguage(SupportedLocales.instance.getSupportedLocales[index].toString());
                    },
                    child: AnimatedContainer(
                      alignment: Alignment.center,
                      height: 40.0,
                      width: 62.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: FlutterDictionaryDelegate.getCurrentLocale.toString() ==
                                  SupportedLocales.instance.getSupportedLocales.toString()
                              ? AppColors.marigold
                              : AppColors.black.withOpacity(0.2),
                        ),
                        color: FlutterDictionaryDelegate.getCurrentLocale.toString() ==
                                SupportedLocales.instance.getSupportedLocales.toString()
                            ? AppColors.wheat20
                            : AppColors.white,
                      ),
                      duration: Duration(milliseconds: 400),
                      child: Text(
                        SupportedLocales.instance.getSupportedLocales[index].toString().toUpperCase(),
                        style: AppFonts.medium16TextStyle,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
