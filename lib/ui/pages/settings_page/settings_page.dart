import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_bloc/language_bloc.dart';
import 'package:fridge_yellow_team_bloc/application/bloc/language_bloc/language_state.dart';
import 'package:fridge_yellow_team_bloc/repositories/auth_repository.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/cubit/settings_page_cubit.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/cubit/settings_page_state.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/settings_view.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage() : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsPageCubit(repository: AuthRepository.instance),
      child: BlocBuilder<SettingsPageCubit, SettingsPageState>(
        builder: (BuildContext context, state) => BlocBuilder<LanguageBloc, LanguageState>(
          builder: (BuildContext context, state) => SettingsView(),
        ),
      ),
    );
  }
}
