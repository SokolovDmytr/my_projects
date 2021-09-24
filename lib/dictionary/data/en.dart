import 'package:yellow_team_fridge/dictionary/dictionary_classes/authentication_page_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/bottom_navigation_bar_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/favorites_page_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/main_page_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/notification_page_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/on_boarding_screen_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/recipes_page_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/screen_recipe_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:yellow_team_fridge/dictionary/models/language.dart';

Language en = Language(
  authenticationPageLanguage: AuthenticationPageLanguage(
    welcome: 'Welcome',
    textFieldPassword: 'Password',
    textFieldConfirmPassword: 'Confirm Password',
    signUp: 'SignUp',
    signIn: 'SignIn',
    registerGoogle: 'Register with Google',
    registerApple: 'Register with Apple',
    newVersionText: '',
    newVersion: 'A new version is available',
    logIn: 'LogIn',
    enterEmail: 'Enter your email',
    buttonShow: 'Show',
    buttonSend: 'Send',
    buttonForgotPassword: 'Forgot your password?',
    buttonOk: 'Ok',
    textFieldEmail: 'Email',
    signInGoogle: 'SignIn with Google',
    signInApple: 'SignIn with Apple',
  ),
  bottomNavigationBarLanguage: BottomNavigationBarLanguage(
    settings: 'Settings',
    favourites: 'Favourites',
    home: 'Home',
  ),
  favouritesPageLanguage: FavouritesPageLanguage(
    favourites: 'Favourites',
    youDoNotHave: 'You don`t have',
    listEmpty: 'Your list is empty',
    basic: 'Basic',
    cal: 'cal',
    min: 'min',
    back: 'Back',
    serverBugPopUp: 'There`s been a bug on the server, please wait',
    removedPopUp: 'This recipe was removed from the favourites',
  ),
  mainPageLanguage: MainPageLanguage(
    buttonOk: 'Ok',
    swipeTutorial: 'You can delete food by swipe to the right or left',
    notFound: 'Not found',
    clearAll: 'Clear all',
    chooseTextField: 'Choose the food',
    buttonWatchRecipes: 'Watch recipes',
    buttonDelete: 'Delete',
  ),
  notificationPageLanguage: NotificationPageLanguage(
    back: 'Back',
    notification: 'Notification',
    version: 'Version',
    versionDescriptionFive: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    versionDescriptionFour: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    versionDescriptionOne: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    versionDescriptionThree: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    versionDescriptionTwo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  onBoardingScreenLanguage: OnBoardingScreenLanguage(
    buttonStart: 'Start',
    buttonNext: 'Next',
    onBoardingScreenFour: 'Follow the recipe and bon appetit',
    onBoardingScreenThree: 'Select a recipe from the list provided',
    onBoardingScreenTwo: 'Pick out all the groceries and click "watch recipes."',
    onBoardingScreenOne: 'Choose the products you have',
  ),
  recipesPageLanguage: RecipesPageLanguage(
    back: 'Back',
    min: 'min',
    cal: 'cal',
    basic: 'basic',
    listEmpty: 'Your list is empty',
    youDoNotHave: 'You don`t have',
    recipes: 'Recipes',
    loading: 'loading',
  ),
  screenRecipeLanguage: ScreenRecipeLanguage(
    basic: 'basic',
    cal: 'cal',
    min: 'min',
    back: 'Back',
    removedFromFavourites: 'This recipe was removed from the favourites',
    addedToFavourites: 'This recipe added to favourites',
    similarRecipes: 'Similar recipes',
    cooking: 'Cooking',
    grams: 'grams',
    pieces: 'pieces',
    foodElements: 'Food elements',
    youHave: 'You have:',
  ),
  settingsPageLanguage: SettingsPageLanguage(
    back: 'Back',
    buttonOk: 'Ok',
    settings: 'Settings',
    buttonNo: 'No',
    youSureWantToExit: 'Are you sure you want to quit the application Empty Fridge?',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    aboutCompany: 'About company',
    language: 'Language',
  ),
);
