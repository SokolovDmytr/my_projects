import 'package:flutter/material.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/services/route_service/route_selectors.dart';
import 'package:memes/ui/global_widgets/global_app_bar.dart';

class MainLayout extends StatelessWidget {
  final Widget body;
  final String title;

  const MainLayout({
    required this.body,
    required this.title,
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
      child: Scaffold(
        appBar: GlobalAppBar(title: title),
        backgroundColor: AppColors.grey,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: body,
        ),
      ),
    );
  }
}
