import 'dart:async';
import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:yellow_team_fridge/models/pages/freezed/ingredient.dart';
import 'package:yellow_team_fridge/models/pages/models/image_with_id.dart';
import 'package:yellow_team_fridge/res/const.dart';
import 'package:yellow_team_fridge/res/image_assets.dart';
import 'package:yellow_team_fridge/services/network_service/res/consts.dart';
import 'package:yellow_team_fridge/utils/loader_image/message_for_isolate.dart';

class LoaderImage {
  static final LoaderImage _instance = LoaderImage._();

  static LoaderImage get instance => _instance;

  LoaderImage._();

  StreamController<ImageWithId> _streamController;
  Completer _completer;

  Stream<ImageWithId> startListenLoadImage({
    @required List<Ingredient> ingredients,
  }) {
    _streamController = StreamController<ImageWithId>();
    _completer = Completer();
    _loadImage(ingredients: ingredients);

    return _streamController.stream;
  }

  void stopListen() {
    _completer.complete();
    _streamController.close();
  }

  Future<List<ImageWithId>> _loadImage({
    @required List<Ingredient> ingredients,
  }) async {
    final Map<String, String> urls = {};
    for (Ingredient ingredient in ingredients) {
      if (ingredient.image != null) {
        urls[ingredient.i] = ingredient.image;
      }
    }

    final ReceivePort port = ReceivePort();
    final Isolate isolate = await Isolate.spawn<MessageForIsolate>(
      loadImagesInIsolate,
      MessageForIsolate(
        urls: urls,
        sendPort: port.sendPort,
      ),
    );

    final List<String> keys = urls.keys.toList();
    final List<ImageWithId> images = [];
    int countOfLoadImage = 0;
    port.listen(
          (message) {
        if (message is ImageWithId) {
          _streamController.add(message);
          countOfLoadImage++;
          if (countOfLoadImage == keys.length) {
            port.close();
          }
        }
      },
      onDone: () => _completer.complete(),
    );
    await Future.wait([_completer.future]);

    isolate.kill();
    return images;
  }
}

void loadImagesInIsolate(MessageForIsolate messageFromIsolate,) {
  try {
    final List<Future> futures = [];
    for (String key in messageFromIsolate.urls.keys) {
      futures.add(
        Future(() async {
          Image image;
          try {
            await http.get(messageFromIsolate.urls[key]).then((response) {
              if (response != null && response.statusCode == networkStatusCodeOk) {
                image = Image.memory(response.bodyBytes);
              } else {
                image = Image.asset(ImageAssets.chefYellow);
              }
            });
          } catch (error) {
            image = Image.asset(ImageAssets.chefYellow);
          }
          messageFromIsolate.sendPort.send(
            ImageWithId(
              image: image,
              id: key,
            ),
          );
        }),
      );
    }

    Future.wait(futures);
  } catch (error) {
    logger.e(error);
  }
}
