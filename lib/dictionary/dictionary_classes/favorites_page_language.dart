import 'package:flutter/cupertino.dart';

class FavouritesPageLanguage {
  final String back;
  final String listEmpty;
  final String favourites;
  final String cal;
  final String basic;
  final String min;
  final String youDoNotHave;

  FavouritesPageLanguage({
    @required this.listEmpty,
    @required this.back,
    @required this.min,
    @required this.youDoNotHave,
    @required this.cal,
    @required this.basic,
    @required this.favourites,
  });

  factory FavouritesPageLanguage.fromJson(Map<String, dynamic> json) {
    return FavouritesPageLanguage(
      back: json['back'],
      min: json['min'],
      cal: json['cal'],
      basic: json['basic'],
      favourites: json['favourites'],
      listEmpty: json['listEmpty'],
      youDoNotHave: json['youDoNotHave'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'back': back,
      'min': min,
      'cal': cal,
      'basic': basic,
      'favourites': favourites,
      'listEmpty': listEmpty,
      'youDoNotHave':youDoNotHave,
    };
  }
}
