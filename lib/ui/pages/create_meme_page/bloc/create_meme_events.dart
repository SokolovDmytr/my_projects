abstract class CreateMemeEvents {}

class CaptionImageEvent extends CreateMemeEvents {}

class CreateBoxesEvent extends CreateMemeEvents {
  final String templateId;
  final int boxCount;

  CreateBoxesEvent({
    required this.templateId,
    required this.boxCount,
  });
}

class UpdateBoxesEvent extends CreateMemeEvents {
  final String text;
  final int index;
  final String? color;
  final String? outlinedColor;

  UpdateBoxesEvent({
    required this.text,
    required this.index,
    this.color,
    this.outlinedColor,
  });
}
