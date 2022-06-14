import 'package:flutter/material.dart';
import 'package:meals/viewmodel/data/dummy_data.dart';
import 'package:meals/widget/category_item/category_item.widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vamos Cozinhar?'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        children: DUMMY_CATEGORIES.map(
          (cat) {
            return CategoryItem(category: cat);
          },
        ).toList(),
      ),
    );
  }
}