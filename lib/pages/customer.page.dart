import 'package:flutter/material.dart';

class CustomerPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Page'),
      ),
      body: Center(
        child: Text('Welcome to the Customer Page!'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to perform when the button is pressed
        },
        child: Icon(Icons.add),
      ),
    );
  }
}