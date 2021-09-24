import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/res/app_styles/app_gradient.dart';
import 'package:yellow_team_fridge/ui/global_widgets/custom_app_bar.dart';

class MainPage extends StatefulWidget {
  MainPage() : super(key: Key('MainPage'));

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        gradient: AppGradient.marigolWheatdGradient,
        title: 'Notification',
        textButton: 'Back',
        isMainStyleAppBar: false,
        preferredSize: Size.fromHeight(137.0),
        key: UniqueKey(),
      ),
      body: Container(),
    );
  }
}
