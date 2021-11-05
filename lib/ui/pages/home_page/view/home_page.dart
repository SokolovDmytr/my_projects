import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_state.dart';
import 'package:fridge_yellow_team_bloc/repositories/ingredient_repository.dart';
import 'package:fridge_yellow_team_bloc/services/dialog_service/dialogs/text_field_loader/text_field_loader_widget.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/bloc/home_page_bloc.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/bloc/home_page_event.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/home_page/view/home_page_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextFieldLoaderWidget _textFieldLoaderWidget = TextFieldLoaderWidget();

    return BlocProvider(
      create: (BuildContext _) => HomePageBloc(
        loader: _textFieldLoaderWidget,
        repository: IngredientRepository.instance,
      ),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (BuildContext blocListenerContext, LanguageState __) {
          blocListenerContext.read<HomePageBloc>().add(
                UpdateListIngredientsWithNewLanguage(),
              );

          return HomePageView(
            loader: _textFieldLoaderWidget,
          );
        },
      ),
    );
  }
}
