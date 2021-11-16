import 'package:memes/models/boxes.dart';

class CreateMemeState {
  final String pictureUrl;
  final Boxes boxes;

  CreateMemeState({
    required this.pictureUrl,
    required this.boxes,
  });

  CreateMemeState copyWith({
    String? pictureUrl,
    Boxes? boxes,
  }) {
    return CreateMemeState(
      pictureUrl: pictureUrl ?? this.pictureUrl,
      boxes: boxes ?? this.boxes,
    );
  }
}
