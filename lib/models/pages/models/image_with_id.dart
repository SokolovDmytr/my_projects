import 'package:flutter/material.dart';

class ImageWithId {
  final Image image;
  final String id;
  DateTime? lastTimeOfUsage;

  ImageWithId({
    required this.image,
    required this.id,
    this.lastTimeOfUsage,
  });
}
