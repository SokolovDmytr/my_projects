import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/screen_recipe_arguments.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/cubit/screen_recipe_page_cubit.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/screen_recipe_page/screen_recipe_page_view.dart';

class ScreenRecipePage extends StatefulWidget {
  const ScreenRecipePage({
    Key? key,
  }) : super(key: key);

  @override
  _ScreenRecipePageState createState() => _ScreenRecipePageState();
}

class _ScreenRecipePageState extends State<ScreenRecipePage> with SingleTickerProviderStateMixin {
  double height = 312.0;

  @override
  Widget build(BuildContext context) {
    final ScreenRecipeArguments arguments = ModalRoute.of(context)!.settings.arguments as ScreenRecipeArguments;

    return BlocProvider(
      create: (BuildContext context) => ScreenRecipePageCubit(isFavorite: arguments.recipes[arguments.index].isFavorite),
      child: ScreenRecipePageView(
        arguments: arguments,
      ),
    );
  }
}
