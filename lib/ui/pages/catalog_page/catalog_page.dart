import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/application/bloc/application_bloc.dart';
import 'package:memes/application/bloc/application_events.dart';
import 'package:memes/application/bloc/application_state.dart';
import 'package:memes/dictionary/dictionary_classes/catalog_page.dart';
import 'package:memes/dictionary/flutter_dictionary.dart';
import 'package:memes/res/app_duration.dart';
import 'package:memes/res/app_fonts.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/app_styles/app_shadows.dart';
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
  ScrollController _scrollController = ScrollController();
  double bottomPosition = -100.0;
  double sidePosition = -100.0;
  bool visible = false;
  double position = 0.0;

  @override
  void dispose() {
    super.dispose();
    memeSearch.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationBloc, ApplicationState>(
      builder: (context, state) => GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: MainLayout(
          appBarType: AppBarType.titleAppBar,
          title: catalogPageLanguage.memesTemplates,
          body: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (_scrollController.position.atEdge) {
                if (_scrollController.position.pixels <= 500.0) {
                  _hide();
                }
              } else {
                _display();
              }
              return true;
            },
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  physics: ScrollPhysics(),
                  child: Column(
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
                      ListView.builder(
                        itemCount: state.searchedList.length + 1,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          if (state.searchedList.isEmpty) {
                            return Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 40.0, right: 20.0, bottom: 50.0, top: 40.0),
                                  child: Image.asset(ImageAssets.sadCryingCat),
                                ),
                                Text(
                                  catalogPageLanguage.notFound,
                                  style: AppFonts.robotoWhite18BoldOpacity065,
                                ),
                              ],
                            );
                          } else {
                            if (index == 0) {
                              return const SizedBox();
                            } else {
                              return MemeCard(
                                memeTemplate: state.searchedList[index - 1],
                              );
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
                AnimatedPositioned(
                  bottom: bottomPosition,
                  left: 10.0,
                  right: 10.0,
                  duration: AppDuration.oneSecond,
                  child: InkWell(
                    onTap: () {
                      _scrollController.jumpTo(_scrollController.position.minScrollExtent);
                    },
                    child: Container(
                      height: 30.0,
                      decoration: BoxDecoration(
                        color: AppColors.metallicBlue,
                        borderRadius: BorderRadius.circular(20.0),
                        boxShadow: [
                          AppShadows.neonGreenSpread1Shadow,
                        ],
                      ),
                      child: Align(
                        child: Text(
                          catalogPageLanguage.goUp,
                          style: AppFonts.robotoWhite18BoldOpacity065,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _display() {
    if (visible) {
      return;
    }
    setState(() {
      bottomPosition = 10.0;
      visible = !visible;
    });
  }

  void _hide() {
    if (visible == false) {
      return;
    }
    setState(() {
      bottomPosition = -100.0;
      visible = !visible;
    });
  }
}
