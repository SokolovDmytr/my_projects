import 'package:memes/models/meme_info_dto.dart';

class ApplicationState {
  final List<MemeInfoDto> list;
  final List<MemeInfoDto> searchedList;

  ApplicationState({
    required this.list,
    required this.searchedList,
  });

  ApplicationState copyWith({
    List<MemeInfoDto>? list,
    List<MemeInfoDto>? searchedList,
  }) {
    return ApplicationState(
      list: list ?? this.list,
      searchedList: searchedList ?? this.searchedList,
    );
  }
}
