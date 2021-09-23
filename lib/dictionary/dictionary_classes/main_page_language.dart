import 'package:flutter/cupertino.dart';

class MainPageLanguage {
  final String chooseTextField;
  final String notFound;
  final String swipeTutorial;
  final String clearAll;
  final String buttonWatchRecipes;
  final String buttonDelete;
  final String buttonOk;

  MainPageLanguage({
    @required this.chooseTextField,
    @required this.notFound,
    @required this.swipeTutorial,
    @required this.clearAll,
    @required this.buttonWatchRecipes,
    @required this.buttonDelete,
    @required this.buttonOk,
  });

  factory MainPageLanguage.fromJson(Map<String, dynamic> json) {
    return MainPageLanguage(
      buttonDelete: json['buttonDelete'],
      buttonOk: json['buttonOk'],
      buttonWatchRecipes: json['buttonWatchRecipes'],
      chooseTextField: json['chooseTextField'],
      clearAll: json['clearAll'],
      notFound: json['notFound'],
      swipeTutorial: json['swipeTutorial'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'buttonDelete': buttonDelete,
      'buttonOk': buttonOk,
      'buttonWatchRecipes': buttonWatchRecipes,
      'chooseTextField': chooseTextField,
      'clearAll': clearAll,
      'notFound': notFound,
      'swipeTutorial': swipeTutorial,
    };
  }
}
