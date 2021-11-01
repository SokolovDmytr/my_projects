import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/recipes_cubit.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/favorite_page/favourites_page_view.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<RecipesCubit>().loadFavouritesRecipes();
    return FavouritesPageView();
  }
}
