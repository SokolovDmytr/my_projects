import 'package:memes/models/meme_info_dto.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/services/route_service/app_routes.dart';
import 'package:memes/services/route_service/route_manager.dart';

class RouteSelectors {
  static bool get canPop => RouteManager.instance.canPop;

  static void Function() doPop() {
    return () => RouteManager.instance.pop();
  }

  static void Function() goToCatalogPage() {
    return () => RouteManager.instance.pushAndRemoveUntil(
          route: AppRoutes.catalogPage,
          routeNamePredicate: emptyString,
        );
  }

  static void Function() goToCreateMemePage({
    required MemeInfoDto memeInfoDto,
  }) {
    return () => RouteManager.instance.push(
          route: AppRoutes.createMemePage,
          arguments: memeInfoDto,
        );
  }
}
