import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/models/meme_info_dto.dart';
import 'package:memes/res/app_duration.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/app_styles/app_shadows.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/res/image_assets.dart';
import 'package:memes/ui/main_layout/main_layout.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_bloc.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_events.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_state.dart';
import 'package:memes/ui/pages/create_meme_page/widgets/box_block.dart';

class CreateMemePage extends StatefulWidget {
  const CreateMemePage({
    Key? key,
  }) : super(key: key);

  @override
  _CreateMemePageState createState() => _CreateMemePageState();
}

class _CreateMemePageState extends State<CreateMemePage> {
  late CreateMemeBloc _bloc;
  List<Widget> _form = [];
  CarouselController _carouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    _bloc = CreateMemeBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _bloc.close();
  }

  @override
  Widget build(BuildContext context) {
    final MemeInfoDto pickedMeme = ModalRoute.of(context)!.settings.arguments as MemeInfoDto;
    _rebuild(pickedMeme);
    _generateForm(pickedMeme: pickedMeme);
    return BlocProvider.value(
      value: _bloc,
      child: BlocConsumer<CreateMemeBloc, CreateMemeState>(
        listener: (context, state) {},
        builder: (context, state) => MainLayout(
          appBarType: AppBarType.buttonsAppBar,
          title: 'Create your own meme',
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 350.0,
                  margin: const EdgeInsets.only(top: 10.0, bottom: 20.0, left: 20.0, right: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColors.black),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      AppShadows.greyShadow,
                      AppShadows.blackShadow,
                    ],
                    // image: DecorationImage(
                    //   image: NetworkImage(
                    //     _bloc.state.pictureUrl,
                    //   ),
                    //   fit: BoxFit.fill,
                    // ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: _bloc.state.pictureUrl,
                    placeholder: (context, url) => Image.asset(ImageAssets.dogeCoin),
                    imageBuilder: (context, image) {
                      return CircleAvatar(
                        backgroundImage: image,
                        radius: 150,
                      );
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.black,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text('Please fill the following form'),
                      CarouselSlider(
                        items: _form,
                        carouselController: _carouselController,
                        options: CarouselOptions(
                          pageSnapping: true,
                          enableInfiniteScroll: true,
                          height: 220.0,
                          viewportFraction: 1.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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

  void _generateForm({required MemeInfoDto pickedMeme}) {
    _form.clear();
    for (int index = 0; index < pickedMeme.boxCount; index++) {
      _form.add(BoxBlock(index: index));
    }
  }
}
