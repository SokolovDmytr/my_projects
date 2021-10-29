import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/image_with_id.dart';
import 'package:fridge_yellow_team_bloc/res/const.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';

class ImageCacheManager {
  static final ImageCacheManager _instance = ImageCacheManager._();

  static ImageCacheManager get instance => _instance;

  final List<ImageWithId> _imageCache;

  ImageCacheManager._() : _imageCache = [];

  Image? getImageWithIdIngredient({
    required Ingredient ingredient,
  }) {
    if (ingredient.image == null) {
      return Image.asset(ImageAssets.chefYellow);
    }

    if (_imageCache.isNotEmpty) {
      try {
        final ImageWithId image = _imageCache.firstWhere((element) => element.id == ingredient.image);
        return image.image;
      } catch (error) {
        logger.i('$error in ImageCacheManager.getImageWithIdIngredient');
      }
    }

    return null;
  }

  void addAllImages({required List<ImageWithId> images}) {
    _imageCache.addAll(images);
  }
}
