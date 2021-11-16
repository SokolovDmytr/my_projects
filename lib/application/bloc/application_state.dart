import 'package:memes/models/meme_info_dto.dart';

class ApplicationState {
  final List<MemeInfoDto> list;

  ApplicationState({
    required this.list,
  });

  ApplicationState copyWith({
    List<MemeInfoDto>? list,
  }) {
    return ApplicationState(list: list ?? this.list);
  }
}
