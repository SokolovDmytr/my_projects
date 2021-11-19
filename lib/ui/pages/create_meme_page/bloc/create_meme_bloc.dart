import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:memes/dictionary/dictionary_classes/snack_bars_language.dart';
import 'package:memes/dictionary/flutter_dictionary.dart';
import 'package:memes/models/boxes.dart';
import 'package:memes/res/app_styles/app_colors.dart';
import 'package:memes/res/consts.dart';
import 'package:memes/services/network_service/models/base_http_response.dart';
import 'package:memes/services/network_service/models/caption_image_params.dart';
import 'package:memes/services/network_service/network_service.dart';
import 'package:memes/services/route_service/route_service.dart';
import 'package:memes/ui/global_widgets/global_snack_bar.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_events.dart';
import 'package:memes/ui/pages/create_meme_page/bloc/create_meme_state.dart';

class CreateMemeBloc extends Bloc<CreateMemeEvents, CreateMemeState> {
  CreateMemeBloc() : super(CreateMemeState(pictureUrl: emptyString, boxes: Boxes(map: {}))) {
    on<CaptionImageEvent>((event, emit) async {
      final SnackBarsLanguage snackBarsLanguage = FlutterDictionary.instance.language.snackBarsLanguage;

      final bool connectionAvailable = await NetworkService.instance.checkInternetConnection();
      if (connectionAvailable == false) {
        ScaffoldMessenger.of(RouteService.instance.navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            content: GlobalSnackBar(text: snackBarsLanguage.noInternet),
            backgroundColor: AppColors.transparent,
          ),
        );
        return;
      }

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
      } else {
        ScaffoldMessenger.of(RouteService.instance.navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            content: GlobalSnackBar(text: snackBarsLanguage.serverError),
            backgroundColor: AppColors.transparent,
          ),
        );
        return;
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

      final SnackBarsLanguage snackBarsLanguage = FlutterDictionary.instance.language.snackBarsLanguage;

      final bool connectionAvailable = await NetworkService.instance.checkInternetConnection();
      if (connectionAvailable == false) {
        ScaffoldMessenger.of(RouteService.instance.navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            content: GlobalSnackBar(text: snackBarsLanguage.noInternet),
            backgroundColor: AppColors.transparent,
          ),
        );
        return;
      }

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

    on<SaveImageOnDeviceEvent>((event, emit) async {
      final SnackBarsLanguage snackBarsLanguage = FlutterDictionary.instance.language.snackBarsLanguage;

      final bool connectionAvailable = await NetworkService.instance.checkInternetConnection();
      if (connectionAvailable == false) {
        ScaffoldMessenger.of(RouteService.instance.navigatorKey.currentContext!).showSnackBar(
          SnackBar(
            content: GlobalSnackBar(text: snackBarsLanguage.noInternet),
            backgroundColor: AppColors.transparent,
          ),
        );
        return;
      }

      final ByteData imageData = await NetworkAssetBundle(Uri.parse(state.pictureUrl)).load(emptyString);
      final Uint8List bytes = imageData.buffer.asUint8List();
      final result = await ImageGallerySaver.saveImage(
        bytes,
        quality: 60,
      );
      print(result);
      ScaffoldMessenger.of(RouteService.instance.navigatorKey.currentContext!).showSnackBar(
        SnackBar(
          content: GlobalSnackBar(text: snackBarsLanguage.saved),
          backgroundColor: AppColors.transparent,
        ),
      );
    });
  }
}
