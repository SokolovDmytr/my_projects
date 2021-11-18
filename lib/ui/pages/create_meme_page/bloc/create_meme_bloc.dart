import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:memes/models/boxes.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/services/network_service/models/base_http_response.dart';
import 'package:memes/services/network_service/models/caption_image_params.dart';
import 'package:memes/services/network_service/network_service.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_events.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_state.dart';

class CreateMemeBloc extends Bloc<CreateMemeEvents, CreateMemeState> {
  CreateMemeBloc() : super(CreateMemeState(pictureUrl: emptyString, boxes: Boxes(map: {}))) {
    on<CaptionImageEvent>((event, emit) async {
      final BaseHttpResponse response = await NetworkService.instance.request(
        type: HttpType.httpPost,
        route: HttpRoute.captionImage,
        parameter: CaptionImageParams(boxes: state.boxes),
      );

      if (response.response != null) {
        emit(
          state.copyWith(
            pictureUrl: response.response['data']['url'],
          ),
        );
      }
    });

    on<CreateBoxesEvent>((event, emit) async {
      emit(
        state.copyWith(
          boxes: state.boxes.createMap(
            templateId: event.templateId,
            boxCount: event.boxCount,
          ),
        ),
      );
      final BaseHttpResponse response = await NetworkService.instance.request(
        type: HttpType.httpPost,
        route: HttpRoute.captionImage,
        parameter: CaptionImageParams(boxes: state.boxes),
      );

      if (response.response != null) {
        emit(
          state.copyWith(
            pictureUrl: response.response['data']['url'],
          ),
        );
      }
    });

    on<UpdateBoxesEvent>((event, emit) async {
      emit(
        state.copyWith(
          boxes: state.boxes.updateMap(
            text: event.text ?? state.boxes.map['boxes[${event.index}][text]']!,
            index: event.index,
            outlineColor: event.outlinedColor ?? state.boxes.map['boxes[${event.index}][outline_color]']!,
            color: event.color ?? state.boxes.map['boxes[${event.index}][color]']!,
            font: event.font ?? state.boxes.map['max_font_size']!,
          ),
        ),
      );
    });
  }
}
