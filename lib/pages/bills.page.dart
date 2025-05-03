import 'package:flutter/material.dart';

class BillsPage extends StatelessWidget{
  BillsPage({super.key});

  @override
  build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Bills"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Text(
          "Bills page",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}