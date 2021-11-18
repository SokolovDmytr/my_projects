import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/ui/global_widgets/global_text_field.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_bloc.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_events.dart';

class TextFieldRow extends StatefulWidget {
  final int index;

  const TextFieldRow({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  _TextFieldRowState createState() => _TextFieldRowState();
}

class _TextFieldRowState extends State<TextFieldRow> {
  TextEditingController font = TextEditingController();
  TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 75.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 10.0),
            child: GlobalTextField(
              controller: font,
              numberInput: true,
              hintText: 'Font',
              onChanged: (font) {
                context.read<CreateMemeBloc>().add(
                  UpdateBoxesEvent(
                    font: this.font.text,
                    index: widget.index,
                  ),
                );
                context.read<CreateMemeBloc>().add(CaptionImageEvent());
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 20.0),
            child: GlobalTextField(
              controller: text,
              hintText: 'Text field ${widget.index}',
              onChanged: (text) {
                context.read<CreateMemeBloc>().add(
                      UpdateBoxesEvent(
                        text: this.text.text,
                        index: widget.index,
                      ),
                    );
                context.read<CreateMemeBloc>().add(CaptionImageEvent());
              },
            ),
          ),
        ),
      ],
    );
  }
}
