import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/store/shared/base_action.dart';

class OpenCardAction extends BaseAction{
  final String id;

  const OpenCardAction({@required this.id,}) : super(type: 'OpenCardAction');
}