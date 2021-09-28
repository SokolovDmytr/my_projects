import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/main_page_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_styles/app_colors.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/ui/global_widgets/custom_app_bar.dart';
import 'package:yellow_team_fridge/ui/pages/settings_page/settings_page.dart';


class MainPage extends StatefulWidget {
  MainPage() : super(key: Key('MainPage'));

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final MainPageLanguage _language =
      FlutterDictionary.instance.language?.mainPageLanguage ?? en.mainPageLanguage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        gradient: AppGradient.marigoldWheatGradient,
        title: 'Notification',
        textButton: 'Back',
        isMainStyleAppBar: false,
        preferredSize: Size.fromHeight(137.0),
        key: UniqueKey(),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SettingsPage()));
            },
            child: Container(
              height: 200.0,
              width: 200.0,
              color: AppColors.black,
            ),
          ),
          Text(_language.buttonWatchRecipes),
        ],
      ),
    );
  }
}
