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
        'boxes[$index][text]': 'Text field ${index + 1}',
        'boxes[$index][color]': emptyString,
        'boxes[$index][outline_color]': emptyString,
        'max_font_size': emptyString,
      });
    }
    return Boxes(map: map);
  }

  Boxes updateMap({
    required int index,
    required String text,
    required String color,
    required String outlineColor,
    required String font,
  }) {
    map.addAll({
      'boxes[$index][text]': text,
      'boxes[$index][color]': color,
      'boxes[$index][outline_color]': outlineColor,
      'max_font_size': '$font',
    });

    return Boxes(map: map);
  }
}
