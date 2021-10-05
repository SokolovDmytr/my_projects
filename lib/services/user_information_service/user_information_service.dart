import 'package:yellow_team_fridge/services/network_service/network_service.dart';
import 'package:yellow_team_fridge/models/pages/token.dart';
import 'package:yellow_team_fridge/services/network_service/models/base_http_response.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';
import 'package:yellow_team_fridge/services/network_service/res/request_params/login_params.dart';
import 'package:yellow_team_fridge/services/network_service/shared/fridge_parser.dart';

class UserInformationService{
  static const tag = '[UserInformationService]';

  static final UserInformationService _instance = UserInformationService._();

  static UserInformationService get instance => _instance;

  UserInformationService._();

  Future<String> getToken() async{
    NetworkService.instance.init(baseUrl: baseUrl);
    final BaseHttpResponse response = await NetworkService.instance.requestWithParams(
      type: HttpType.httpGet,
      route: HttpRoute.login,
      parameter: LoginParams(
        email: 'maximshirokostup@capdefier.com',
        password: '12345',
      ),
    );
    if (response.error == null) {
      final Token token = FridgeParser.instance.parseEntity(
        exampleObject: Token,
        response: response,
      );

      return token.token;
    }
    return null;
  }
}