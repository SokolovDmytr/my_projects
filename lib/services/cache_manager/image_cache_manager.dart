import 'package:flutter/material.dart';
import 'package:fridge_yellow_team_bloc/models/pages/freezed/ingredient.dart';
import 'package:fridge_yellow_team_bloc/models/pages/models/image_with_id.dart';
import 'package:fridge_yellow_team_bloc/res/image_assets.dart';


class ImageCacheManager {
  static final ImageCacheManager _instance = ImageCacheManager._();

  static ImageCacheManager get instance => _instance;

  ImageCacheManager._();

  Image? getImageWithIdIngredient({
    required Ingredient ingredient,
  }) {
    if (ingredient.image == null) {
      return Image.asset(ImageAssets.chefYellow);
    }

    final List<ImageWithId> images = [];
    if (images.isNotEmpty) {
      final Iterable<ImageWithId> iterable = images.where((element) => element.id == ingredient.i);
      if (iterable.isNotEmpty) {
        return iterable.first.image;
      }
    }

    return null;
  }
}
