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

Language he = Language(
  authenticationPageLanguage: AuthenticationPageLanguage(
    welcome: 'ברוך הבא',
    textFieldPassword: 'סיסמה',
    textFieldConfirmPassword: 'אשר סיסמה',
    signUp: 'הירשם',
    signIn: 'להתחבר',
    registerGoogle: 'הרשמה ב- Google',
    registerApple: 'הרשמה ב- Apple',
    newVersionText: '',
    newVersion: 'קיימת גרסה חדשה',
    logIn: 'התחברות',
    enterEmail: 'הכנס את האימייל שלך',
    buttonShow: 'הופעה',
    buttonSend: 'לִשְׁלוֹחַ',
    buttonForgotPassword: 'שכחת ססמה?',
    buttonOk: 'בסדר',
    textFieldEmail: 'אימייל',
    signInApple: 'היכנס עם אפל',
    signInGoogle: 'היכנס עם Google',
  ),
  bottomNavigationBarLanguage: BottomNavigationBarLanguage(
    settings: 'הגדרות',
    favourites: 'מועדפים',
    home: 'בית',
  ),
  favouritesPageLanguage: FavouritesPageLanguage(
    favourites: 'מועדפים',
    youDoNotHave: 'אין לך',
    listEmpty: 'הרשימה שלך ריקה',
    basic: 'בסיסי',
    cal: 'cal',
    min: 'דקות',
    back: 'חזור',
    serverBugPopUp: 'אירעה באג בשרת, אנא המתן',
    removedPopUp: 'מתכון זה הוסר מהמועדפים',
  ),
  mainPageLanguage: MainPageLanguage(
    buttonOk: 'בסדר',
    swipeTutorial: 'אתה יכול למחוק מזון על ידי החלקה ימינה או שמאלה',
    notFound: 'לא נמצא',
    clearAll: 'נקה הכל',
    chooseTextField: 'בחר את האוכל',
    buttonWatchRecipes: 'צפו במתכונים',
    buttonDelete: 'לִמְחוֹק',
  ),
  notificationPageLanguage: NotificationPageLanguage(
    back: 'חזור',
    notification: 'הוֹדָעָה',
    version: 'גִרְסָה',
    versionDescriptionFive: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    versionDescriptionFour: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    versionDescriptionOne: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    versionDescriptionThree: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    versionDescriptionTwo: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  onBoardingScreenLanguage: OnBoardingScreenLanguage(
    buttonStart: 'הַתחָלָה',
    buttonNext: 'הַבָּא',
    onBoardingScreenFour: 'עקוב אחר המתכון ובתאבון',
    onBoardingScreenThree: 'בחר מתכון מהרשימה המופיעה',
    onBoardingScreenTwo: 'בחר את כל המצרכים ולחץ על "צפה במתכונים".',
    onBoardingScreenOne: 'בחר את המוצרים שיש לך',
  ),
  recipesPageLanguage: RecipesPageLanguage(
    basic: 'בסיסי',
    cal: 'cal',
    min: 'דקות',
    back: 'חזור',
    listEmpty: 'הרשימה שלך ריקה',
    youDoNotHave: 'אין לך',
    recipes: 'מתכונים',
    loading: 'טוען',
  ),
  screenRecipeLanguage: ScreenRecipeLanguage(
    basic: 'בסיסי',
    cal: 'cal',
    min: 'דקות',
    back: 'חזור',
    removedFromFavourites: 'מתכון זה הוסר מהמועדפים',
    addedToFavourites: 'המתכון הזה נוסף למועדפים',
    similarRecipes: 'מתכונים דומים',
    cooking: 'בישול',
    grams: 'גרם',
    pieces: 'חתיכות',
    foodElements: 'רכיבי מזון',
    youHave: 'יש לך:',
  ),
  settingsPageLanguage: SettingsPageLanguage(
    back: 'חזור',
    buttonOk: 'בסדר',
    settings: 'הגדרות',
    buttonNo: 'לא',
    youSureWantToExit: 'האם אתה בטוח שברצונך לסגור את היישום ריק המקרר?',
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    aboutCompany: 'אודות חברה',
    language: 'שפה',
  ),
);
