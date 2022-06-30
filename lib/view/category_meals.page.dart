import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';
import 'package:meals/widget/meals_item.widget.dart';

import '../data/dummy_data.dart';

class CategoriesMealsPage extends StatelessWidget {
  const CategoriesMealsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoryModel = ModalRoute.of(context)?.settings.arguments as CategoryModel;

    final categoryMeals = DUMMY_MEALS.where((meals) {
      return meals.categories.contains(categoryModel.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel.title),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return MealsItemWidget(
              meal: categoryMeals[index],
            );
          },
        ),
      ),
    );
  }
}
