import 'package:flutter/cupertino.dart';

class RecipesPageLanguage {
  final String listEmpty;
  final String back;
  final String recipes;
  final String loading;
  final String youDoNotHave;
  final String cal;
  final String basic;
  final String min;

  RecipesPageLanguage({
    @required this.listEmpty,
    @required this.back,
    @required this.recipes,
    @required this.loading,
    @required this.youDoNotHave,
    @required this.cal,
    @required this.basic,
    @required this.min,
  });

  factory RecipesPageLanguage.fromJson(Map<String, dynamic> json) {
    return RecipesPageLanguage(
      back: json['back'],
      min: json['min'],
      cal: json['cal'],
      basic: json['basic'],
      listEmpty: json['listEmpty'],
      youDoNotHave: json['youDoNotHave'],
      loading: json['loading'],
      recipes: json['recipes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'back': back,
      'min': min,
      'cal': cal,
      'basic': basic,
      'recipes': recipes,
      'loading': loading,
      'listEmpty': listEmpty,
      'youDoNotHave': youDoNotHave,
    };
  }
}
