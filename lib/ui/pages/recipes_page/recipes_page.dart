import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/cubit/recipes_cubit.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/recipes_page/recipes_page_view.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<RecipesCubit>(),
      child: RecipesPageView(),
    );
  }
}
