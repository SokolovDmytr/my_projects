import 'package:flutter/cupertino.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class SetLanguageAction extends BaseAction{
 final String languageCode;

  const SetLanguageAction({
    @required this.languageCode,
  });
}
