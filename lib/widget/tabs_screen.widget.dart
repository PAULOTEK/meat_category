import 'package:flutter/material.dart';
import 'package:meals/model/meals.dart';
import 'package:meals/view/categories_screen.page.dart';
import 'package:meals/view/favorite_screen.page.dart';
import 'package:meals/widget/main_menu.dart';

class TabsScreenWidget extends StatefulWidget {
  const TabsScreenWidget({Key? key, required this.favoriteMeals}) : super(key: key);
  final List<MealsModel> favoriteMeals;

  @override
  State<TabsScreenWidget> createState() => _TabsScreenWidgetState();
}

class _TabsScreenWidgetState extends State<TabsScreenWidget> {
  int _selectScreenIndex = 0;
  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];
  final List<Widget> _screens = [];

  @override
  void initState() {
    super.initState();
    [
      const CategoriesScreen(),
      FavoriteScreenPage(favoriteMeals: widget.favoriteMeals),
    ];
  }

  _selectScreen(int index) {
    setState(
      () {
        _selectScreenIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectScreenIndex]),
      ),
      drawer: const MainMenu(),
      body: _screens[_selectScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Colors.pink,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        currentIndex: _selectScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
