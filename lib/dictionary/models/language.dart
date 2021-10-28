import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/authentication_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/bottom_navigation_bar_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/favorites_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/main_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/notification_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/on_boarding_screen_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/recipes_page_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/screen_recipe_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/settings_page_language.dart';


class Language {
  final AuthenticationPageLanguage authenticationPageLanguage;
  final BottomNavigationBarLanguage bottomNavigationBarLanguage;
  final FavouritesPageLanguage favouritesPageLanguage;
  final MainPageLanguage mainPageLanguage;
  final NotificationPageLanguage notificationPageLanguage;
  final OnBoardingScreenLanguage onBoardingScreenLanguage;
  final RecipesPageLanguage recipesPageLanguage;
  final ScreenRecipeLanguage screenRecipeLanguage;
  final SettingsPageLanguage settingsPageLanguage;
  final DialogLanguage dialogLanguage;

  const Language({
    required this.authenticationPageLanguage,
    required this.bottomNavigationBarLanguage,
    required this.favouritesPageLanguage,
    required this.mainPageLanguage,
    required this.notificationPageLanguage,
    required this.onBoardingScreenLanguage,
    required this.recipesPageLanguage,
    required this.screenRecipeLanguage,
    required this.settingsPageLanguage,
    required this.dialogLanguage,
  });
}
