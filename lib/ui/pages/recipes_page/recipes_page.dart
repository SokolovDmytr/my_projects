import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/recipes_cubit.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/recipes_page/recipes_page_view.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Ingredient> ingredients = ModalRoute.of(context)!.settings.arguments as List<Ingredient>;
    context.read<RecipesCubit>().loadRecipes(ingredients: ingredients);
    return RecipesPageView();
  }
}
