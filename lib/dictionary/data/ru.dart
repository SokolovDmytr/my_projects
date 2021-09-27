import 'package:yellow_team_fridge/dictionary/dictionary_classes/authentication_page_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/bottom_navigation_bar_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/dialog_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/favorites_page_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/main_page_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/notification_page_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/on_boarding_screen_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/recipes_page_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/screen_recipe_language.dart';
import 'package:yellow_team_fridge/dictionary/dictionary_classes/settings_page_language.dart';
import 'package:yellow_team_fridge/dictionary/models/language.dart';

Language ru = Language(
  authenticationPageLanguage: AuthenticationPageLanguage(
    welcome: 'Добро пожаловать',
    textFieldPassword: 'Пароль',
    signInApple: 'Войти при помощи Apple',
    signInGoogle: 'Войти при помощи Google',
    textFieldConfirmPassword: 'Подтвердите пароль',
    signUp: 'Зарегистрироваться',
    signIn: 'Войти',
    registerGoogle: 'Зарегистрироваться при помощи Google',
    registerApple: 'Зарегистрироваться при помощи Apple',
    logIn: 'Авторизоваться',
    enterEmail: 'Введите адрес электронной почты',
    buttonShow: 'Показать',
    buttonSend: 'Отправить',
    buttonForgotPassword: 'Забыли пароль?',
    textFieldEmail: 'Почта',
  ),
  bottomNavigationBarLanguage: BottomNavigationBarLanguage(
    settings: 'Настройки',
    favourites: 'Избранное',
    home: 'Главная',
  ),
  favouritesPageLanguage: FavouritesPageLanguage(
    favourites: 'Избранное',
    youDoNotHave: 'У Вас нет',
    listEmpty: 'Ваш список пуст',
    basic: 'Базовая',
    cal: 'кал',
    min: 'минуты',
    back: 'Назад',
  ),
  mainPageLanguage: MainPageLanguage(
    buttonOk: 'Ок',
    swipeTutorial: 'Вы можете удалить еду, проведя пальцем вправо или влево',
    notFound: 'Не найдено',
    clearAll: 'Очистить все',
    chooseTextField: 'Выберите еду',
    buttonWatchRecipes: 'Смотреть рецепты',
    buttonDelete: 'Удалить',
  ),
  notificationPageLanguage: NotificationPageLanguage(
    back: 'Назад',
    notification: 'Уведомления',
    version: 'Версия',
    versionDescriptionFive:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    versionDescriptionFour:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    versionDescriptionOne:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    versionDescriptionThree:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    versionDescriptionTwo:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
  ),
  onBoardingScreenLanguage: OnBoardingScreenLanguage(
    buttonStart: 'Начать',
    buttonNext: 'Следующий',
    onBoardingScreenFour: 'Соблюдайте рецепт и приятного аппетита',
    onBoardingScreenThree: 'Выберите рецепт из представленного списка',
    onBoardingScreenTwo: 'Выберите все продукты и нажми «смотреть рецепты».',
    onBoardingScreenOne: 'Выберите продукты, которые у вас есть',
  ),
  recipesPageLanguage: RecipesPageLanguage(
    back: 'Назад',
    basic: 'Базовая',
    cal: 'кал',
    min: 'минуты',
    listEmpty: 'Ваш список пуст',
    youDoNotHave: 'У Вас нет',
    recipes: 'Рецепты',
    loading: 'загрузка',
  ),
  screenRecipeLanguage: ScreenRecipeLanguage(
    basic: 'Базовая',
    cal: 'кал',
    min: 'минуты',
    back: 'Назад',
    similarRecipes: 'Похожие рецепты',
    cooking: 'Готовка',
    grams: 'граммы',
    pieces: 'шт',
    foodElements: 'Ингридиенты',
    youHave: 'У вас есть:',
  ),
  settingsPageLanguage: SettingsPageLanguage(
    back: 'Назад',
    buttonOk: 'Ок',
    settings: 'Настройки',
    buttonNo: 'Нет',
    youSureWantToExit: 'Вы уверены, что хотите выйти из приложения Empty Fridge?',
    description:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
    aboutCompany: 'О компании',
    language: 'Язык',
  ),
  dialogLanguage: DialogLanguage(
    loginPopUpTitle: 'Доступна новая версия',
    loginPopUpNewVersionText: '',
    loginPopUpButtonText: 'Ok',
    logOutPopUpTitle: 'Вы уверены, что хотите выйти из приложения',
    logOutPopUpAppName: 'Empty Fridge',
    logOutPopUpButtonNoText: 'Нет',
    logOutPopUpButtonYesText: 'Да',
    favoritesRemovedPopUpText: 'Этот рецепт удален из избранного',
    popUpConnectionError: 'На сервере произошла ошибка, подождите',
    recipePopUpAddedText: 'Рецепт добавлен в избранное',
    deletePopUpTitle: 'Вы хотите удалить ',
    deletePopUpButtonOkText: 'Ок',
    deletePopUpButtonCancelText: 'Отмена',
    defaultErrorText: 'Ошибка',
  ),
);
