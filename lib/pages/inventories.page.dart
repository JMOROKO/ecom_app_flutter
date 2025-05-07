import 'package:flutter/material.dart';

class InventoriesPage extends StatelessWidget{

  InventoriesPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inventories"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}