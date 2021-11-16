import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_bloc.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_events.dart';

class ColorsList extends StatefulWidget {
  final TextEditingController text;
  final int index;

  const ColorsList({
    required this.text,
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  _ColorsListState createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {
  List<Color> _colors = [
    AppColors.black,
    AppColors.green,
    AppColors.yellow,
    AppColors.red,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.0,
      child: ListView.builder(
        itemCount: _colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print(widget.text.text.isNotEmpty);
              if (widget.text.text.isNotEmpty) {
                context.read<CreateMemeBloc>().add(
                      UpdateBoxesEvent(
                        text: widget.text.text,
                        color: '#${_colors[index].toString().substring(10, 16)}',
                        index: widget.index,
                      ),
                    );
                context.read<CreateMemeBloc>().add(CaptionImageEvent());
              }
            },
            child: Container(
              margin: const EdgeInsets.all(10.0),
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: _colors[index],
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          );
        },
      ),
    );
  }
}
