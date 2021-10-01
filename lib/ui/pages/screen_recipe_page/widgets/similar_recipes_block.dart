import 'package:flutter/material.dart';
import 'package:yellow_team_fridge/ui/pages/favourites_page/widgets/recipe_element.dart';

class SimilarRecipesBlock extends StatefulWidget {
  const SimilarRecipesBlock({Key key}) : super(key: key);

  @override
  _SimilarRecipesBlockState createState() => _SimilarRecipesBlockState();
}

class _SimilarRecipesBlockState extends State<SimilarRecipesBlock> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => RecipeElement(
        recipe: null,
        isOpen: null,
        openCard: null,
      ),
    );
  }
}
