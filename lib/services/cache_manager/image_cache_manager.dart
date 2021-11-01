import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/image_with_id.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';
import 'package:fridge_yellow_team_bloc/services/network_service/res/consts.dart';
import 'package:http/http.dart' as http;

class ImageCacheManager {
  static final ImageCacheManager _instance = ImageCacheManager._();

  static ImageCacheManager get instance => _instance;

  final List<ImageWithId> _ingredientImageCache;
  final List<ImageWithId> _recipeImageCache;

  ImageCacheManager._()
      : _ingredientImageCache = [],
        _recipeImageCache = [];

  Future<Image?> getImageWithUrl({
    required String? url,
  }) async {
    if (url == null) {
      return Image.asset(ImageAssets.chefYellow);
    }

    if (_ingredientImageCache.isNotEmpty) {
      try {
        final ImageWithId image = _ingredientImageCache.firstWhere((element) => element.id == url);
        return image.image;
      } catch (error) {
        logger.i(error);
      }
    }

    if (_recipeImageCache.isNotEmpty) {
      try {
        final ImageWithId image = _recipeImageCache.firstWhere((element) => element.id == url);
        return image.image;
      } on StateError catch (_) {
        try {
          final http.Response response = await http.get(
            Uri.parse(url),
          );
          if (response.statusCode == networkStatusCodeOk) {
            final Image image = Image.memory(response.bodyBytes);
            _recipeImageCache.add(
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
    }

    return null;
  }

  void addAllImages({required List<ImageWithId> images}) {
    _ingredientImageCache.addAll(images);
  }
}
