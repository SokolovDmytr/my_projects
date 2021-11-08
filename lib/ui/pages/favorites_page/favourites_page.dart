import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_bloc/language_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_bloc/language_state.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc/recipes_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/recipes_bloc/recipes_event.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/favorites_page/favourites_page_view.dart';

class FavouritesPage extends StatefulWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback(
      (timeStamp) {
        context.read<RecipesBloc>().add(
              LoadFavoriteRecipesEvent(),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (BuildContext context, state) => FavouritesPageView(),
    );
  }
}
