import 'package:flutter/cupertino.dart';

class BottomNavigationBarLanguage {
  final String home;
  final String favourites;
  final String settings;

  BottomNavigationBarLanguage({
    @required this.home,
    @required this.favourites,
    @required this.settings,
  });

  factory BottomNavigationBarLanguage.fromJson(Map<String, dynamic> json) {
    return BottomNavigationBarLanguage(
      home: json['home'],
      favourites: json['favourites'],
      settings: json['settings'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'home': home,
      'favourites': favourites,
      'settings': settings,
    };
  }
}
