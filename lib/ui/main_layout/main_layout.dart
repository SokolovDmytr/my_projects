import 'package:flutter/material.dart';
import 'package:memes/res/app_gradients.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/services/route_service/route_selectors.dart';
import 'package:memes/ui/global_widgets/global_app_bar.dart';

class MainLayout extends StatelessWidget {
  final Widget body;
  final AppBarType appBarType;
  final String? title;
  final void Function()? downloadButtonFunction;

  const MainLayout({
    required this.body,
    required this.appBarType,
    this.downloadButtonFunction,
    this.title,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (RouteSelectors.canPop) {
          RouteSelectors.doPop().call();
          return true;
        }
        return false;
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: AppGradients.metallicBlack,
        ),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: GlobalAppBar(
            title: title ?? emptyString,
            type: appBarType,
            downloadButtonFunction: downloadButtonFunction,
          ),
          body: body,
        ),
      ),
    );
  }
}