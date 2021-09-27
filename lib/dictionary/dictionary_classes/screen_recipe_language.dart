import 'package:flutter/cupertino.dart';

class ScreenRecipeLanguage {
  final String back;
  final String min;
  final String cal;
  final String basic;
  final String foodElements;
  final String pieces;
  final String grams;
  final String cooking;
  final String similarRecipes;
  final String youHave;

  ScreenRecipeLanguage({
    @required this.back,
    @required this.min,
    @required this.cal,
    @required this.basic,
    @required this.foodElements,
    @required this.pieces,
    @required this.grams,
    @required this.cooking,
    @required this.similarRecipes,
    @required this.youHave,
  });

  factory ScreenRecipeLanguage.fromJson(Map<String, dynamic> json) {
    return ScreenRecipeLanguage(
      back: json['back'],
      min: json['min'],
      cal: json['cal'],
      basic: json['basic'],
      foodElements: json['foodElements'],
      pieces: json['pieces'],
      grams: json['grams'],
      cooking: json['cooking'],
      similarRecipes: json['similarRecipes'],
      youHave: json['youHave'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'back': back,
      'min': min,
      'cal': cal,
      'basic': basic,
      'foodElements': foodElements,
      'pieces': pieces,
      'grams': grams,
      'cooking': cooking,
      'similarRecipes': similarRecipes,
      'youHave': youHave,
    };
  }
}
