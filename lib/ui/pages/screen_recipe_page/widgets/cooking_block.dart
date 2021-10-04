import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';

class CookingBlock extends StatelessWidget {
  final Recipe recipe;

  const CookingBlock({
    @required this.recipe,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Cooking:'),
        ListView.builder(
          itemCount: recipe.steps.length,
          itemBuilder: (context, index) =>
              Text('${index} ${recipe.steps[index]}'),
        )
      ],
    );
  }
}
