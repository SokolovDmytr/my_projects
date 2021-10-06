import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/token.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class SaveTokenAction extends BaseAction {
  final Token token;

  const SaveTokenAction({
    @required this.token,
  });
}
