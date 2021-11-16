import 'package:flutter/material.dart';
import 'package:memes/models/meme_info_dto.dart';
import 'package:memes/res/app_fonts.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/services/route_service/route_selectors.dart';

class MemeCard extends StatefulWidget {
  final MemeInfoDto memeTemplate;

  const MemeCard({
    required this.memeTemplate,
    Key? key,
  }) : super(key: key);

  @override
  _MemeCardState createState() => _MemeCardState();
}

class _MemeCardState extends State<MemeCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: RouteSelectors.goToCreateMemePage(memeInfoDto: widget.memeTemplate),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: AppColors.purpleBlue,
          border: Border.all(
            color: AppColors.black,
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.all(8.0),
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.memeTemplate.url),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      widget.memeTemplate.name,
                      style: AppFonts.memeName,
                      overflow: TextOverflow.clip,
                      maxLines: 10,
                    ),
                  ),
                ),
              ],
            ),
            Text(
              '*click to create your own "funny" and special joke',
              style: AppFonts.memeHint,
            ),
          ],
        ),
      ),
    );
  }
}
