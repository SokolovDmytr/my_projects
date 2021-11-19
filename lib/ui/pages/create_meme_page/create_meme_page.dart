import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/dictionary/dictionary_classes/create_meme_page_language.dart';
import 'package:memes/dictionary/flutter_dictionary.dart';
import 'package:memes/models/meme_info_dto.dart';
import 'package:memes/res/app_duration.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/res/image_assets.dart';
import 'package:memes/ui/global_widgets/global_text_field.dart';
import 'package:memes/ui/main_layout/main_layout.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_bloc.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_events.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_state.dart';
import 'package:memes/ui/pages/create_meme_page/widgets/network_image_widget.dart';
import 'package:memes/ui/pages/create_meme_page/widgets/options_card.dart';

class CreateMemePage extends StatefulWidget {
  const CreateMemePage({
    Key? key,
  }) : super(key: key);

  @override
  _CreateMemePageState createState() => _CreateMemePageState();
}

class _CreateMemePageState extends State<CreateMemePage> {
  final CreateMemePageLanguage createMemePageLanguage = FlutterDictionary.instance.language.createMemePageLanguage;
  TextEditingController font = TextEditingController();
  late CreateMemeBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = CreateMemeBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
    font.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final MemeInfoDto pickedMeme = ModalRoute.of(context)!.settings.arguments as MemeInfoDto;
    _rebuild(pickedMeme);
    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<CreateMemeBloc, CreateMemeState>(
        listener: (context, state) {},
        builder: (context, state) => MainLayout(
          appBarType: AppBarType.buttonsAppBar,
          downloadButtonFunction: () {
            if (state.pictureUrl != emptyString) {
              _bloc.add(SaveImageOnDeviceEvent());
            }
          },
          body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus!.unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl: _bloc.state.pictureUrl,
                    placeholder: (context, url) {
                      return NetworkImageWidget(
                        decorationImage: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            ImageAssets.dogeCoin,
                          ),
                        ),
                      );
                    },
                    imageBuilder: (context, image) {
                      return NetworkImageWidget(
                        decorationImage: DecorationImage(
                          image: image,
                          fit: BoxFit.fill,
                        ),
                      );
                    },
                    errorWidget: (context, url, error) {
                      return NetworkImageWidget(
                        decorationImage: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            ImageAssets.dogeCoin,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: 150.0,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, left: 40.0),
                      child: GlobalTextField(
                        controller: font,
                        numberInput: true,
                        hintText: createMemePageLanguage.fontField,
                        onChanged: (font) {
                          context.read<CreateMemeBloc>().add(
                                UpdateBoxesEvent(
                                  font: this.font.text,
                                  index: 0,
                                ),
                              );
                          context.read<CreateMemeBloc>().add(CaptionImageEvent());
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: OptionsCard(
                      meme: pickedMeme,
                      cardType: OptionsCardType.textFieldsCard,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: OptionsCard(
                      meme: pickedMeme,
                      cardType: OptionsCardType.colorsCard,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _rebuild(MemeInfoDto pickedMeme) async {
    _bloc.add(
      CreateBoxesEvent(
        templateId: pickedMeme.id,
        boxCount: pickedMeme.boxCount,
      ),
    );
    Future.delayed(AppDuration.threeSeconds);
    setState(() {});
  }
}
