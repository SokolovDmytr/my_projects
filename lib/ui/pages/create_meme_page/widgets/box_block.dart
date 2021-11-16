import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/ui/global_widgets/global_text_field.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_bloc.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_events.dart';
import 'package:memes/ui/pages/create_meme_page/widgets/color_list.dart';

class BoxBlock extends StatelessWidget {
  final int index;

  const BoxBlock({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    TextEditingController colorController = TextEditingController();
    TextEditingController outlineColorController = TextEditingController();
    return Column(
      children: [
        Text('Set parameters for the text field number ${index + 1}'),
        GlobalTextField(
          controller: textController,
          onChanged: (_) {
            if (textController.text.isNotEmpty) {
              context.read<CreateMemeBloc>().add(
                    UpdateBoxesEvent(
                      text: textController.text,
                      index: index,
                    ),
                  );
              context.read<CreateMemeBloc>().add(CaptionImageEvent());
            }
          },
        ),
        ColorsList(
          text: textController,
          index: index,
        ),
        // ColorsList(),
        // GlobalTextField(
        //   controller: colorController,
        //   onChanged: (_) {
        //     if (textController.text.isNotEmpty) {
        //       context.read<CreateMemeBloc>().add(
        //             UpdateBoxesEvent(
        //               text: textController.text,
        //               color: colorController.text,
        //               index: index,
        //             ),
        //           );
        //       context.read<CreateMemeBloc>().add(CaptionImageEvent());
        //     }
        //   },
        // ),
        // GlobalTextField(
        //   controller: outlineColorController,
        //   onChanged: (_) {
        //     if (textController.text.isNotEmpty) {
        //       context.read<CreateMemeBloc>().add(
        //             UpdateBoxesEvent(
        //               text: textController.text,
        //               outlinedColor: outlineColorController.text,
        //               index: index,
        //             ),
        //           );
        //       context.read<CreateMemeBloc>().add(CaptionImageEvent());
        //     }
        //   },
        // ),
      ],
    );
  }
}
