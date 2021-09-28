// import 'package:yellow_team_fridge/services/internet_connection_helper.dart';
// import 'package:yellow_team_fridge/services/network_service/interfaces/i_base_http_error.dart';
// import 'package:yellow_team_fridge/services/network_service/models/base_http_response.dart';
//
// class InternetConnectionService {
//
//
//   static Future<BaseHttpResponse> checkInternetConnection() async {
//     bool internetCheck = await InternetConnectionHelper.hasInternetConnection();
//     BaseHttpResponse response = BaseHttpResponse();
//     if (internetCheck) {
//       response = BaseHttpResponse(
//         error: IBaseHttpError(
//           statusCode: 100, error: null,
//         ),
//         response:,
//       );
//     } else {
//       response = BaseHttpResponse(
//         error: IBaseHttpError(
//           error: 502,
//           statusCode:,
//         ),
//         response:,
//       );
//     }
//     return response;
//   }
// }