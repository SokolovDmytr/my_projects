import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/dictionary/dictionary_classes/create_meme_page_language.dart';
import 'package:memes/dictionary/flutter_dictionary.dart';
import 'package:memes/res/app_fonts.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/app_styles/app_shadows.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_bloc.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_events.dart';

class ColorsList extends StatefulWidget {
  final int index;

  const ColorsList({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  _ColorsListState createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  final CreateMemePageLanguage createMemePageLanguage = FlutterDictionary.instance.language.createMemePageLanguage;
  List<Color> _colors = [
    AppColors.black,
    AppColors.green,
    AppColors.yellow,
    AppColors.red,
    AppColors.white,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
          child: Text(
            '${createMemePageLanguage.textField} ${widget.index + 1} ${createMemePageLanguage.mainColor}',
            style: AppFonts.robotoWhite18Bold,
          ),
        ),
        SizedBox(
          height: 50.0,
          child: ListView.builder(
            itemCount: _colors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.read<CreateMemeBloc>().add(
                        UpdateBoxesEvent(
                          color: '#${_colors[index].toString().substring(10, 16)}',
                          index: widget.index,
                        ),
                      );
                  context.read<CreateMemeBloc>().add(CaptionImageEvent());
                },
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: _colors[index],
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      AppShadows.neonGreenSpread1Shadow,
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 10.0),
          child: Text(
            '${createMemePageLanguage.textField} ${widget.index + 1} ${createMemePageLanguage.outlineColor}',
            style: AppFonts.robotoWhite18Bold,
          ),
        ),
        SizedBox(
          height: 50.0,
          child: ListView.builder(
            itemCount: _colors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  context.read<CreateMemeBloc>().add(
                        UpdateBoxesEvent(
                          outlinedColor: '#${_colors[index].toString().substring(10, 16)}',
                          index: widget.index,
                        ),
                      );
                  context.read<CreateMemeBloc>().add(CaptionImageEvent());
                },
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: _colors[index],
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      AppShadows.neonGreenSpread1Shadow,
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
