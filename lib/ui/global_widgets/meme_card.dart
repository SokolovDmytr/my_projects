import 'package:flutter/material.dart';
import 'package:memes/models/meme_info_dto.dart';
import 'package:memes/res/app_fonts.dart';
import 'package:memes/res/app_gradients.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/app_styles/app_shadows.dart';
import 'package:memes/services/route_service/route_selectors.dart';
import 'package:memes/ui/global_widgets/global_button/global_button.dart';

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
    return Container(
      height: 330.0,
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(10.0),
        gradient: AppGradients.greyTopLeftToBottomRight,
        boxShadow: [
          AppShadows.greyShadow,
          AppShadows.blackShadow,
        ],
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: AppGradients.metallicLeftToRight,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: AppGradients.metallicRightToLeft,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: AppGradients.metallicTopToBottom,
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: AppGradients.metallicBottomToTop,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.memeTemplate.name,
                      style: AppFonts.memeName,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      height: 200.0,
                      width: 200.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.memeTemplate.url),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GlobalButton(
                        onTap: RouteSelectors.goToCreateMemePage(memeInfoDto: widget.memeTemplate),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    '*click to create your own "funny" and special joke',
                    style: AppFonts.memeHint,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
