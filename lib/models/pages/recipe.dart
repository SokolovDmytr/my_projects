import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/ingredient.dart';

class Recipe {
  final int i;
  final String name;
  final String image;
  final double calories;
  final int time;
  final String level;
  final List<Ingredient> ingredients;

  const Recipe({
    @required this.i,
    @required this.name,
    @required this.image,
    @required this.calories,
    @required this.time,
    @required this.level,
    @required this.ingredients,
  });
}
