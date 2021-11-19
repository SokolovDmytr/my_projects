import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/application/bloc/application_bloc.dart';
import 'package:memes/application/bloc/application_events.dart';
import 'package:memes/application/bloc/application_state.dart';
import 'package:memes/dictionary/dictionary_classes/catalog_page.dart';
import 'package:memes/dictionary/flutter_dictionary.dart';
import 'package:memes/res/app_fonts.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/res/image_assets.dart';
import 'package:memes/ui/global_widgets/global_text_field.dart';
import 'package:memes/ui/global_widgets/meme_card.dart';
import 'package:memes/ui/main_layout/main_layout.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({Key? key}) : super(key: key);

  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  TextEditingController memeSearch = TextEditingController();
  final CatalogPageLanguage catalogPageLanguage = FlutterDictionary.instance.language.catalogPageLanguage;

  @override
  void dispose() {
    super.dispose();
    memeSearch.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: MainLayout(
          appBarType: AppBarType.titleAppBar,
          title: catalogPageLanguage.memesTemplates,
          body: ListView.builder(
            itemCount: state.searchedList.length + 1,
            itemBuilder: (context, index) {
              if (state.searchedList.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GlobalTextField(
                        controller: memeSearch,
                        hintText: catalogPageLanguage.searchField,
                        onChanged: (name) {
                          context.read<ApplicationBloc>().add(SearchTemplatesEvent(searchText: memeSearch.text));
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                      child: Image.asset(ImageAssets.sadCryingCat),
                    ),
                    Text(
                      catalogPageLanguage.notFound,
                      style: AppFonts.robotoWhite18Bold,
                    ),
                  ],
                );
              } else if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GlobalTextField(
                    controller: memeSearch,
                    hintText: catalogPageLanguage.searchField,
                    onChanged: (name) {
                      context.read<ApplicationBloc>().add(SearchTemplatesEvent(searchText: memeSearch.text));
                    },
                  ),
                );
              } else {
                return MemeCard(
                  memeTemplate: state.searchedList[index - 1],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
