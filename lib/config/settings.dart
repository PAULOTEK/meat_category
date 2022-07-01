import 'package:flutter/material.dart';
import 'package:meals/model/settings.model.dart';
import 'package:meals/widget/main_menu.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final settingsModel = SettingsModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainMenu(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Confugurações',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const Divider(),
                _createSwitch(
                  "Sem Glutén",
                  "Só exibe refeiçõees sem gluten!",
                  settingsModel.isGlutenFree,
                  (value) => setState(
                    () => settingsModel.isGlutenFree = value,
                  ),
                ),
                const Divider(),
                _createSwitch(
                  "Sem Lactose",
                  'Só exibir refeições sem lactose!',
                  settingsModel.isLactoseFree,
                  (value) => setState(
                    () => settingsModel.isLactoseFree = value,
                  ),
                ),
                const Divider(),
                _createSwitch(
                  "Vegana",
                  'Só exibir refeições veganas!',
                  settingsModel.isVegan,
                  (value) => setState(
                    () => settingsModel.isVegan = value,
                  ),
                ),
                const Divider(),
                _createSwitch(
                  "Vegetariana",
                  'Só exibir refeições vegetariana!',
                  settingsModel.isVegetarian,
                  (value) => setState(
                    () => settingsModel.isVegetarian = value,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createSwitch(String tittle, String subtitle, bool value, Function(bool) onClick) {
    return SwitchListTile.adaptive(
      title: Text(tittle),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onClick,
    );
  }
}
