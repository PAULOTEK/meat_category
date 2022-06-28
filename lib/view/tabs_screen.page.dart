import 'package:flutter/material.dart';
import 'package:meals/view/categories_screen.page.dart';
import 'package:meals/view/favorite_screen.page.dart';

class TabsScreenPage extends StatefulWidget {
  const TabsScreenPage({Key? key}) : super(key: key);

  @override
  State<TabsScreenPage> createState() => _TabsScreenPageState();
}

class _TabsScreenPageState extends State<TabsScreenPage> {
  int _selectScreenIndex = 0;
  final List<String> _titles = [
    'Lista de Categorias',
    'Meus Favoritos',
  ];
  final List<Widget> _screens = [
    const CategoriesScreen(),
    const FavoriteScreenPage(),
  ];

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
