import 'package:flutter/material.dart';
import 'package:meals/model/meals.dart';
import 'package:meals/widget/meals_item.widget.dart';

class FavoriteScreenPage extends StatelessWidget {
  const FavoriteScreenPage({
    Key? key,
    required this.favoriteMeals,
  }) : super(key: key);
  final List<MealsModel>? favoriteMeals;
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals!.isEmpty) {
      return const Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteMeals!.length,
        itemBuilder: (ctx, index) {
          return MealsItemWidget(
            meal: favoriteMeals![index],
          );
        },
      );
    }
  }
}
