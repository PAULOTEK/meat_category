import 'package:flutter/material.dart';
import 'package:meals/widget/main_menu.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainMenu(),
      body: const Center(
        child: Text('Configurações!'),
      ),
    );
  }
}
