import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:yellow_team_fridge/models/pages/recipe.dart';
import 'package:yellow_team_fridge/res/app_fonts.dart';
import 'package:yellow_team_fridge/ui/pages/favourites_page/widgets/recipe_element.dart';

class SimilarRecipesBlock extends StatefulWidget {
  final List<Recipe> listRecipes;

  const SimilarRecipesBlock({
    this.listRecipes,
    Key key,
  }) : super(key: key);

  @override
  _SimilarRecipesBlockState createState() => _SimilarRecipesBlockState();
}

class _SimilarRecipesBlockState extends State<SimilarRecipesBlock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, bottom: 70.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 40.0,
              bottom: 20.0,
            ),
            child: Text(
              'Similar recipes',
              style: AppFonts.normalBlackTextStyle,
            ),
          ),
          SizedBox(
            height: 150.0,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.listRecipes.length,
              itemBuilder: (context, index) => Container(
                height: 125.0,
                width: 350.0,
                margin: const EdgeInsets.only(right: 20.0),
                child: InkWell(
                  onTap: () {},
                  child: RecipeElement(
                    recipe: widget.listRecipes[index],
                    isOpen: false,
                    openCard: null,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
