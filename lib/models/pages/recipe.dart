import 'package:flutter/material.dart';

class Recipe {
  String image;
  String name;
  int calories;
  int timeCooking;
  String complexity;
  List<String> ingredients;

  Recipe({
    this.image,
    @required this.name,
    @required this.calories,
    @required this.timeCooking,
    this.complexity,
    this.ingredients,
  });

  List<String> getIngredients() => ingredients;
}
