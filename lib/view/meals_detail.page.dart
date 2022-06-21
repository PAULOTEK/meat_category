import 'package:flutter/material.dart';

class MealDetailPage extends StatelessWidget {
  const MealDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Refeição'),
      ),
    );
  }
}
