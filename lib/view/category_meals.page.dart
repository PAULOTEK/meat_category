import 'package:flutter/material.dart';
import 'package:meals/model/category.dart';

class CategoriesMealsPage extends StatelessWidget {
  const CategoriesMealsPage({Key? key, required this.categoryModel}) : super(key: key);

  final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryModel.title),
      ),
      body: Center(
        child: Text('Receitas por Categoria ${categoryModel.id}'),
      ),
    );
  }
}
