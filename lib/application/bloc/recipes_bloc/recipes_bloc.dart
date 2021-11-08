import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/ingridients_bloc/ingredients_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc/recipes_event.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc/recipes_state.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/application_token_cubit.dart';
import 'package:fridge_yellow_team_bloc/dictionary/dictionary_classes/dialog_language.dart';
import 'package:fridge_yellow_team_bloc/dictionary/flutter_dictionary.dart';
import 'package:fridge_yellow_team_bloc/models/exception/no_internet_connection_exception.dart';
import 'package:fridge_yellow_team_bloc/models/exception/server_error_exception.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/recipe.dart';
import 'package:fridge_yellow_team_bloc/repositories/repositories_interface/i_recipe_repository.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialog_service.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/error_dialog/error_dialog_widget.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/loader/loader_pop_up.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/loader/loader_widget.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/models/base_http_response.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/network_service.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/shared/fridge_parser.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/pop_up_service.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/recipes_pop_up_widget.dart';
import 'package:fridge_yellow_team_bloc/services/pop_up_service/server_error_pop_up_widget.dart';
import 'package:fridge_yellow_team_bloc/services/route_service/route_service.dart';

class RecipesBloc extends Bloc<RecipesEvent, RecipesState> {
  final IRecipeRepository repository;

  RecipesBloc({
    required this.repository,
  }) : super(
    const RecipesState(
      recipes: [],
      favoriteRecipes: [],
    ),
  ) {
    on<LoadRecipesEvent>(
          (event, emit) async {
        final DialogLanguage language = FlutterDictionary.instance.language.dialogLanguage;

        DialogService.instance.show(
          dialog: LoaderPopUp(
            title: language.loadingText,
            state: true,
            loaderKey: LoaderKey.getData,
            child: LoaderWidget(),
          ),
        );

        try {
          final bool isConnection = await NetworkService.instance.checkInternetConnection();

          if (isConnection == false) {
            throw NoInternetConnectionException();
          }

          final String token = await RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().getToken();

          final List<String> ids = [];
          for (Ingredient ingredient in event.ingredients) {
            ids.add(ingredient.i);
          }

          final BaseHttpResponse response = await repository.fetchRecipesDataWithIds(
            token: token,
            ids: ids,
          );

          List<Recipe> favoriteRecipes = [];
          if (state.favoriteRecipes.isEmpty) {
            final BaseHttpResponse responseWithFavoriteRecipe = await repository.fetchFavoriteRecipeData(token: token);
            if (responseWithFavoriteRecipe.response == null) {
              throw ServerError();
            } else {
              favoriteRecipes = FridgeParser.instance.parseList(
                exampleObject: Recipe,
                response: responseWithFavoriteRecipe,
              ) as List<Recipe>;
            }
          } else {
            favoriteRecipes = state.favoriteRecipes;
          }

          if (response.response == null) {
            throw ServerError();
          } else {
            final List<Recipe> recipes = FridgeParser.instance.parseList(
              exampleObject: Recipe,
              response: response,
            ) as List<Recipe>;

            final List<Ingredient> ingredients =
                RouteService.instance.navigatorKey.currentState!.context.read<IngredientsBloc>().state.allIngredients;

            final List<Recipe> resRecipes = [];
            for (Recipe recipe in recipes) {
              bool isFavoriteRecipe = false;

              for (Recipe favoriteRecipe in favoriteRecipes) {
                if (recipe.i == favoriteRecipe.i) {
                  isFavoriteRecipe = true;
                  break;
                }
              }

              final List<Ingredient> resIngredients = [];
              for (Ingredient ingredient in recipe.ingredients) {
                for (Ingredient dataIngredient in ingredients) {
                  if (ingredient.i == dataIngredient.i) {
                    resIngredients.add(
                      ingredient.copyWith(
                        name: dataIngredient.name,
                        image: dataIngredient.image,
                      ),
                    );
                  }
                }
              }

              resRecipes.add(
                recipe.copyWith(
                  ingredients: resIngredients,
                  isFavorite: isFavoriteRecipe,
                ),
              );
            }

            DialogService.instance.close();

            emit(state.copyWith(inputRecipe: resRecipes));
          }
        } on NoInternetConnectionException {
          DialogService.instance.close();

          DialogService.instance.show(
            dialog: ErrorDialog(
              child: ErrorDialogWidget(),
            ),
          );
          return;
        } on ServerError {
          DialogService.instance.close();

          PopUpService.instance.show(
            widget: ServerErrorPopUpWidget(),
          );
        }
      },
    );

    on<LoadFavoriteRecipesEvent>(
          (event, emit) async {
        final DialogLanguage language = FlutterDictionary.instance.language.dialogLanguage;

        DialogService.instance.show(
          dialog: LoaderPopUp(
            title: language.loadingText,
            state: true,
            loaderKey: LoaderKey.getData,
            child: LoaderWidget(),
          ),
        );

        try {
          final bool isConnection = await NetworkService.instance.checkInternetConnection();

          if (isConnection == false) {
            throw NoInternetConnectionException();
          }

          final String token = await RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().getToken();
          final BaseHttpResponse response = await repository.fetchFavoriteRecipeData(token: token);

          if (response.response == null) {
            throw ServerError();
          } else {
            final List<Recipe> recipes = FridgeParser.instance.parseList(
              exampleObject: Recipe,
              response: response,
            ) as List<Recipe>;

            final List<Ingredient> allIngredients =
                RouteService.instance.navigatorKey.currentState!.context.read<IngredientsBloc>().state.allIngredients;

            final List<Recipe> resRecipes = [];
            for (Recipe recipe in recipes) {
              final List<Ingredient> resIngredients = [];
              for (Ingredient ingredient in recipe.ingredients) {
                for (Ingredient dataIngredient in allIngredients) {
                  if (ingredient.i == dataIngredient.i) {
                    resIngredients.add(
                      ingredient.copyWith(
                        name: dataIngredient.name,
                        image: dataIngredient.image,
                      ),
                    );
                  }
                }
              }

              resRecipes.add(
                recipe.copyWith(
                  isFavorite: true,
                  ingredients: resIngredients,
                ),
              );
            }

            emit(state.copyWith(inputFavoriteRecipes: resRecipes));

            DialogService.instance.close();
          }
        } on NoInternetConnectionException {
          DialogService.instance.close();

          DialogService.instance.show(
            dialog: ErrorDialog(
              child: ErrorDialogWidget(),
            ),
          );
          return;
        } on ServerError {
          DialogService.instance.close();

          PopUpService.instance.show(
            widget: ServerErrorPopUpWidget(),
          );
        }
      },
    );

    on<AddFavouritesRecipeEvent>(
          (event, emit) async {
        final DialogLanguage language = FlutterDictionary.instance.language.dialogLanguage;
        final List<Recipe> favouritesRecipe = List.of(state.favoriteRecipes);
        favouritesRecipe.add(
          event.recipe.copyWith(isFavorite: true),
        );
        emit(
          state.copyWith(inputFavoriteRecipes: favouritesRecipe),
        );

        try {
          final bool isConnection = await NetworkService.instance.checkInternetConnection();

          if (isConnection == false) {
            throw NoInternetConnectionException();
          }

          final String token = await RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().getToken();
          final BaseHttpResponse response = await repository.addToFavorite(token: token, recipeId: event.recipe.i.toString());

          if (response.response == null) {
            throw ServerError();
          } else {
            PopUpService.instance.show(
              widget: RecipesPopUpWidget(
                text: language.recipePopUpAddedText,
              ),
            );
          }
        } on NoInternetConnectionException {
          favouritesRecipe.removeWhere((element) => element.i == event.recipe.i);
          emit(
            state.copyWith(inputFavoriteRecipes: favouritesRecipe),
          );

          PopUpService.instance.show(
            widget: ServerErrorPopUpWidget(),
          );
          return;
        } on ServerError {
          favouritesRecipe.removeWhere((element) => element.i == event.recipe.i);
          emit(
            state.copyWith(inputFavoriteRecipes: favouritesRecipe),
          );

          PopUpService.instance.show(
            widget: ServerErrorPopUpWidget(),
          );
        }
      },
    );

    on<RemoveFavouriteRecipeEvent>(
      (event, emit) async {
        final DialogLanguage language = FlutterDictionary.instance.language.dialogLanguage;

        final List<Recipe> favouriteRecipe = List.of(state.favoriteRecipes);
        favouriteRecipe.removeWhere((element) => element.i == event.recipe.i);
        emit(
          state.copyWith(inputFavoriteRecipes: favouriteRecipe),
        );

        try {
          final bool isConnection = await NetworkService.instance.checkInternetConnection();

          if (isConnection == false) {
            throw NoInternetConnectionException();
          }

          final String token = await RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().getToken();
          final BaseHttpResponse response = await repository.removeFromFavorite(token: token, recipeId: event.recipe.i.toString());

          if (response.response == null) {
            throw ServerError();
          } else {
            PopUpService.instance.show(
              widget: RecipesPopUpWidget(
                text: language.favoritesRemovedPopUpText,
              ),
            );
          }
        } on NoInternetConnectionException {
          favouriteRecipe.add(event.recipe);
          emit(
            state.copyWith(inputFavoriteRecipes: favouriteRecipe),
          );
          PopUpService.instance.show(
            widget: ServerErrorPopUpWidget(),
          );
          return;
        } on ServerError {
          favouriteRecipe.add(event.recipe);
          emit(
            state.copyWith(inputFavoriteRecipes: favouriteRecipe),
          );

          PopUpService.instance.show(
            widget: ServerErrorPopUpWidget(),
          );
        }
      },
    );

    on<ClearAllListRecipesEvent>(
          (event, emit) => emit(
        RecipesState(
          recipes: [],
          favoriteRecipes: [],
        ),
      ),
    );

    on<UpdateRecipesEvent>((event, emit) {
      emit(
        state.copyWith(inputFavoriteRecipes: event.favouriteRecipes),
      );
    });

    on<QuientlyFetchFavoritesRecipeEvent>((event, emit) async {
      final String token = await RouteService.instance.navigatorKey.currentState!.context.read<ApplicationTokenCubit>().getToken();
      final BaseHttpResponse responseFavoriteRecipe = await repository.fetchFavoriteRecipeData(token: token);

      if (responseFavoriteRecipe.error == null) {
        final List<dynamic> recipes = FridgeParser.instance.parseList(
          exampleObject: Recipe,
          response: responseFavoriteRecipe,
        );
        final List<Ingredient> ingredients = RouteService.instance.navigatorKey.currentState!.context.read<IngredientsBloc>().state.allIngredients;

        final List<Recipe> resRecipes = [];

        for (Recipe recipe in recipes) {
          final List<Ingredient> resIngredients = [];
          for (Ingredient ingredient in recipe.ingredients) {
            for (Ingredient dataIngredient in ingredients) {
              if (ingredient.i == dataIngredient.i) {
                resIngredients.add(
                  ingredient.copyWith(
                    name: dataIngredient.name,
                    image: dataIngredient.image,
                  ),
                );
              }
            }
          }

          resRecipes.add(
            recipe.copyWith(
              isFavorite: true,
              ingredients: resIngredients,
            ),
          );
        }

        emit(
          state.copyWith(inputFavoriteRecipes: resRecipes),
        );
        event.completer.complete(true);
      } else {
        event.completer.complete(false);
      }
    });
  }
}
