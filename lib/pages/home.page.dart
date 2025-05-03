import 'package:flutter/material.dart';

import '../widgets/menu.drawer.widget.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawerWidget(),
      appBar: AppBar(
        title: Text("Accueil"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text(
          "Page d'accueil",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}