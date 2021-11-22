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
      height: 300.0,
      margin: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(10.0),
        gradient: AppGradients.greyTopLeftToBottomRight,
        boxShadow: [
          AppShadows.greyShadowTopLeft,
          AppShadows.blackShadowBottomRight,
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
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.memeTemplate.name,
                          style: AppFonts.robotoWhite18BoldOpacity065,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: GlobalButton(
                        onTap: RouteSelectors.goToCreateMemePage(memeInfoDto: widget.memeTemplate),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 200.0,
                  width: 200.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(widget.memeTemplate.url),
                    ),
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
