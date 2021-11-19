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
  final int index;
  final String? text;
  final String? color;
  final String? outlinedColor;
  final String? font;

  UpdateBoxesEvent({
    required this.index,
    this.text,
    this.color,
    this.outlinedColor,
    this.font,
  });
}

class SaveImageOnDeviceEvent extends CreateMemeEvents {}
