import 'package:flutter/material.dart';
import 'package:meals/config/settings.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/model/meals.dart';
import 'package:meals/model/settings.model.dart';
import 'package:meals/routes/app.routes.dart';
import 'package:meals/view/category_meals.page.dart';
import 'package:meals/view/meals_detail.page.dart';
import 'package:meals/widget/tabs_screen.widget.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<MealsModel> _availableMeals = DUMMY_MEALS;
  SettingsModel settingsModel = SettingsModel();
  final List<MealsModel> _favoriteMeals = [];
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
        AppRoutes.HOME: (ctx) => TabsScreenWidget(
              favoriteMeals: _favoriteMeals,
            ),
        AppRoutes.CATEGORIES_MEALS: (ctx) => CategoriesMealsPage(
              meals: _availableMeals,
            ),
        AppRoutes.MEALS_DETAIL: (ctx) =>
            MealDetailPage(isFavorite: _isFavorite, onToggleFavorite: _toggleFavorite),
        AppRoutes.SETTINGS: (ctx) => SettingsPage(
              onSettingChanged: _filterMeals,
              settingsModel: settingsModel,
            ),
      },
    );
  }

  void _filterMeals(SettingsModel settingsModel) {
    setState(
      () {
        this.settingsModel = settingsModel;
        _availableMeals = DUMMY_MEALS.where((meals) {
          final filterGluten = settingsModel.isGlutenFree && !meals.isGlutenFree;
          final filterLactose = settingsModel.isLactoseFree && !meals.isLactoseFree;
          final filterVegan = settingsModel.isVegan && !meals.isVegan;
          final filterVegetarian = settingsModel.isVegetarian && !meals.isVegetarian;
          return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;
        }).toList();
      },
    );
  }

  bool _isFavorite(MealsModel meal) {
    return _favoriteMeals.contains(meal);
  }

  void _toggleFavorite(MealsModel meal) {
    setState(() {
      _favoriteMeals.contains(meal) ? _favoriteMeals.remove(meal) : _favoriteMeals.add(meal);
    });
  }
}
