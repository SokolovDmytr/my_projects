import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:memes/res/app_fonts.dart';
import 'package:memes/res/app_gradients.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/app_styles/app_shadows.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/services/route_service/route_selectors.dart';
import 'package:memes/ui/global_widgets/global_button/global_button.dart';

class GlobalAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final AppBarType type;
  final void Function()? downloadButtonFunction;

  const GlobalAppBar({
    required this.title,
    required this.type,
    this.downloadButtonFunction,
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.transparent,
      ),
    );
    switch (type) {
      case AppBarType.titleAppBar:
        return Container(
          height: 60.0,
          margin: const EdgeInsets.only(top: 50.0, right: 30.0, left: 30.0, bottom: 5.0),
          decoration: BoxDecoration(
            color: AppColors.black,
            border: Border.all(color: AppColors.neonBlue),
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              AppShadows.neonGreenSpread1Shadow,
            ],
          ),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: AppGradients.neonLeftToRight,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: AppGradients.neonRightToLeft,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: AppGradients.neonBottomToTop,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: AppGradients.neonTopToBottom,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  style: AppFonts.pixelWhite60NeonShadow,
                ),
              ),
            ],
          ),
        );
      case AppBarType.buttonsAppBar:
        return Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, top: 60.0, bottom: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GlobalButton(
                onTap: () {
                  if (RouteSelectors.canPop) {
                    RouteSelectors.doPop().call();
                  }
                },
                icon: const Icon(
                  Icons.home,
                  color: AppColors.white,
                  size: 40.0,
                ),
              ),
              GlobalButton(
                onTap: downloadButtonFunction ?? () {},
                icon: const Icon(
                  Icons.arrow_downward_sharp,
                  color: AppColors.white,
                  size: 40.0,
                ),
              ),
            ],
          ),
        );
    }
  }
}
