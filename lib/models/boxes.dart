import 'package:memes/res/consts.dart';

class Boxes {
  final Map<String, String> map;

  const Boxes({
    required this.map,
  });

  Boxes createMap({
    required String templateId,
    required int boxCount,
  }) {
    Map<String, String> map = {
      parameterKeys['template_id']!: templateId,
      parameterKeys['username']!: userName,
      parameterKeys['password']!: password,
    };
    for (int index = 0; index < boxCount; index++) {
      map.addAll({
        'boxes[$index][text]': emptyString,
        'boxes[$index][color]': emptyString,
        'boxes[$index][outline_color]': emptyString,
      });
    }
    return Boxes(map: map);
  }

  Boxes updateMap({
    required text,
    required index,
    String? color,
    String? outlineColor,
  }) {
    map.addAll({
      'boxes[$index][text]': text,
      'boxes[$index][color]': color ?? emptyString,
      'boxes[$index][outline_color]': outlineColor ?? emptyString,
    });

    return Boxes(map: map);
  }
}
