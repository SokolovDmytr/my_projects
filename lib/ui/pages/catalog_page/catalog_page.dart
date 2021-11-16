import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/application/bloc/application_bloc.dart';
import 'package:memes/application/bloc/application_state.dart';
import 'package:memes/ui/global_widgets/meme_card.dart';
import 'package:memes/ui/main_layout/main_layout.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) => MainLayout(
        title: 'Memes templates',
        body: ListView.builder(
          itemCount: state.list.length,
          itemBuilder: (context, index) => MemeCard(
            memeTemplate: state.list[index],
          ),
        ),
      ),
    );
  }
}
