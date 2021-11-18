import 'package:flutter/material.dart';
import 'package:memes/models/meme_info_dto.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/app_styles/app_shadows.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/ui/pages/create_meme_page/widgets/color_list.dart';
import 'package:memes/ui/pages/create_meme_page/widgets/text_field_row.dart';

class OptionsCard extends StatefulWidget {
  final MemeInfoDto meme;
  final OptionsCardType cardType;

  const OptionsCard({
    required this.meme,
    required this.cardType,
    Key? key,
  }) : super(key: key);

  @override
  _OptionsCardState createState() => _OptionsCardState();
}

class _OptionsCardState extends State<OptionsCard> {
  late double height;
  List<Widget> listOptions = [];

  @override
  Widget build(BuildContext context) {
    switch (widget.cardType) {
      case (OptionsCardType.textFieldsCard):
        _createTextFields();
        return Container(
          height: height,
          margin: const EdgeInsets.symmetric(horizontal: 40.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: AppColors.metallicBlack,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: AppColors.metallicBlack,
              width: 2.0,
            ),
            boxShadow: [
              AppShadows.greyShadow,
              AppShadows.blackShadow,
            ],
          ),
          child: Column(children: listOptions),
        );
      case (OptionsCardType.colorsCard):
        _createColorLists();
        return Container(
          height: height,
          margin: const EdgeInsets.symmetric(horizontal: 40.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: AppColors.metallicBlack,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: AppColors.metallicBlack,
              width: 2.0,
            ),
            boxShadow: [
              AppShadows.greyShadow,
              AppShadows.blackShadow,
            ],
          ),
          child: Column(children: listOptions),
        );
      default:
        return const SizedBox();
    }
  }

  void _createTextFields() {
    listOptions.clear();
    height = widget.meme.boxCount * 82.0;
    for (int index = 0; index < widget.meme.boxCount; index++) {
      listOptions.add(TextFieldRow(index: index));
    }
  }

  void _createColorLists() {
    listOptions.clear();
    height = widget.meme.boxCount * 194.0;
    for (int index = 0; index < widget.meme.boxCount; index++) {
      listOptions.add(
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: ColorsList(index: index),
        ),
      );
    }
  }
}
