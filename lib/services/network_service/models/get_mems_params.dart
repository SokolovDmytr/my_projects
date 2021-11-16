import 'package:memes/res/consts.dart';
import 'package:memes/services/network_service/interfaces/i_parameter.dart';

class GetMemesParams implements IParameter {
  @override
  Map<String, String> getParams() {
    return parameterKeys;
  }
}
