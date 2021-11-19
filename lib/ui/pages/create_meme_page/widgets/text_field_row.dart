import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/dictionary/dictionary_classes/create_meme_page_language.dart';
import 'package:memes/dictionary/flutter_dictionary.dart';
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
  TextEditingController text = TextEditingController();
  final CreateMemePageLanguage createMemePageLanguage = FlutterDictionary.instance.language.createMemePageLanguage;

  @override
  void dispose() {
    super.dispose();
    text.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, top: 20.0),
        child: GlobalTextField(
          controller: text,
          hintText: '${createMemePageLanguage.textField} ${widget.index + 1}',
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
    );
  }
}
