import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/cubit/settings_page_cubit.dart';
import 'package:fridge_yellow_team_bloc/ui/pages/settings_page/settings_view.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage() : super(key: UniqueKey());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SettingsPageCubit(),
      child: SettingsView(),
    );
  }
}
