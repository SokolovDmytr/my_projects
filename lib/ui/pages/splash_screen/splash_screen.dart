import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/application/bloc/application_bloc.dart';
import 'package:memes/application/bloc/application_events.dart';
import 'package:memes/res/app_duration.dart';
import 'package:memes/res/app_gradients.dart';
import 'package:memes/res/app_styles/app_shadows.dart';
import 'package:memes/res/image_assets.dart';
import 'package:memes/services/route_service/route_selectors.dart';
import 'package:memes/ui/pages/splash_screen/widgets/my_circular_loader.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ApplicationBloc>().add(FetchMemesEvent());
    Future.delayed(
      AppDuration.threeSeconds,
      RouteSelectors.goToCatalogPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                gradient: AppGradients.metallicBlack,
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      AppShadows.greyShadowTopLeft,
                      AppShadows.blackShadowBottomRight,
                    ],
                  ),
                  child: Image.asset(ImageAssets.dogeCoin),
                ),
                MyCircularLoader(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
