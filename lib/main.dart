import 'package:flutter/material.dart';
import 'package:meals/routes/app.routes.dart';
import 'package:meals/view/categories_screen.page.dart';
import 'package:meals/view/category_meals.page.dart';
import 'package:meals/view/meals_detail.page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.pink,
        ).copyWith(
          secondary: Colors.amberAccent,
        ),
        canvasColor: const Color.fromARGB(255, 255, 255, 190),
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const CategoriesScreen(),
        AppRoutes.CATEGORIES_MEALS: (ctx) => const CategoriesMealsPage(),
        AppRoutes.MEALS_DETAIL: (ctx) => const MealDetailPage(),
      },
    );
  }
}
