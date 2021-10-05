// import 'package:flutter/material.dart';
//
// class MissingIngredientsList extends StatefulWidget {
//   const MissingIngredientsList({Key key}) : super(key: key);
//
//   @override
//   _MissingIngredientsListState createState() => _MissingIngredientsListState();
// }
//
// class _MissingIngredientsListState extends State<MissingIngredientsList> {
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text('You don`t have:'),
//         ListView.builder(
//           itemCount: widget.recipe.ingredients.length,
//           itemBuilder: (context, index) =>
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Image.network(widget.ingredientsStored[index].image),
//                       Text(widget.ingredientsStored[index].name),
//                     ],
//                   ),
//                   Row(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Text(widget.ingredientsStored[index].count),
//                       Text(widget.ingredientsStored[index].description),
//                     ],
//                   ),
//                 ],
//               ),
//         )
//       ],
//     )
//     ,
//     ;
//   }
// }
