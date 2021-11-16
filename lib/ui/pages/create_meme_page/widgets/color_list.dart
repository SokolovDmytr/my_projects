import 'package:flutter/material.dart';
import 'package:memes/res/app_styles/app_colors.dart';

class ColorsList extends StatefulWidget {
  const ColorsList({Key? key}) : super(key: key);

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
          print(_colors[index]);
          return InkWell(
            onTap: () {},
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
