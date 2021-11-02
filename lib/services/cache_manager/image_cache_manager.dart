import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/image_with_id.dart';
import 'package:fridge_yellow_team_bloc/res/app_duration.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';
import 'package:fridge_yellow_team_bloc/utils/function_delay.dart';
import 'package:fridge_yellow_team_bloc/utils/loader_image/loader_image.dart';
import 'package:http/http.dart' as http;

class ImageCacheManager {
  static final ImageCacheManager _instance = ImageCacheManager._();

  static ImageCacheManager get instance => _instance;

  final List<ImageWithId> _ingredientImageCache;
  final List<ImageWithId> _imageCache;
  final Completer completer;

  ImageCacheManager._()
      : _ingredientImageCache = [],
        _imageCache = [],
        completer = Completer();

  Future<Image?> getImageWithUrl({
    required String? url,
  }) async {
    if (url == null) {
      return Image.asset(ImageAssets.chefYellow);
    }

    if (completer.isCompleted == false) {
      await Future.wait([completer.future]);
    }

    if (_ingredientImageCache.isNotEmpty) {
      try {
        final ImageWithId image = _ingredientImageCache.firstWhere((element) => element.id == url);
        return image.image;
      } catch (_){}
    }

    try {
      final ImageWithId image = _imageCache.firstWhere((element) => element.id == url);
      return image.image;
    } on StateError catch (error) {
      logger.i(error);

      try {
        final http.Response response = await http.get(
          Uri.parse(url),
        );
        if (response.statusCode == networkStatusCodeOk) {
          final Image image = Image.memory(response.bodyBytes);
          _imageCache.add(
            ImageWithId(
              image: image,
              id: url,
            ),
          );
          return image;
        }
      } catch (error) {
        logger.e(error);
      }
    }

    return null;
  }

  Future<void> loadImages({required List<Ingredient> ingredients}) async {
    final FunctionDelay delay = FunctionDelay(duration: AppDuration.twoSecond);
    final Stream<ImageWithId> stream = LoaderImage.instance.startListenLoadImage(ingredients: ingredients);
    stream.listen((image) {
      _ingredientImageCache.add(image);

      delay.run(() {
        completer.complete();
      });
    });

    await Future.wait([completer.future]);
    LoaderImage.instance.stopListen();
  }
}
