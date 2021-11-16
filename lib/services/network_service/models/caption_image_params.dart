import 'package:memes/models/boxes.dart';
import 'package:memes/services/network_service/interfaces/i_parameter.dart';

class CaptionImageParams implements IParameter {
  final Boxes boxes;

  CaptionImageParams({
    required this.boxes,
  });

  @override
  Map<String, String> getParams() {
    return boxes.map;
  }
}
