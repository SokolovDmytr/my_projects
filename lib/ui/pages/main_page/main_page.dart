import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/dictionary/data/en.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/dialog_language.dart';
import 'package:yellow_team_fridge/dictionary/flutter_dictionary.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialogs/success_dialog/success_dialog.dart';
import 'package:yellow_team_fridge/services/dialog_service/dialogs/success_dialog/success_dialog_widget.dart';
import 'package:yellow_team_fridge/ui/global_widgets/custom_app_bar.dart';
import 'package:yellow_team_fridge/ui/global_widgets/global_button.dart';

class MainPage extends StatefulWidget {
  MainPage()
      : super(
          key: Key('MainPage'),
        );

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final DialogLanguage language = FlutterDictionary.instance.language?.dialogLanguage ?? en.dialogLanguage;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        gradient: AppGradient.marigolWheatdGradient,
        title: 'Notification',
        textButton: 'Back',
        isMainStyleAppBar: true,
        preferredSize: Size.fromHeight(88.0),
        key: UniqueKey(),
      ),
      body: Center(
        child: GlobalButton(
          onTap: () {
            SuccessDialog(
              child: SuccessDialogWidget(),
            ).show();
          },
          gradient: AppGradient.wheatMarigoldGradient,
          key: Key('123'),
          width: 312.0,
          height: 56.0,
          text: 'Watch recipes',
          fontText: AppFonts.normalMediumTextStyle,
        ),
      ),
    );
  }
}
