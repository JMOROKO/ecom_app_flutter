import 'package:ecom_app_flutter/pages/bills.page.dart';
import 'package:ecom_app_flutter/pages/customer.page.dart';
import 'package:ecom_app_flutter/pages/home.page.dart';
import 'package:ecom_app_flutter/pages/inventories.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //masquer la barre de debug
      debugShowCheckedModeBanner: false,
      // routage
      routes: {
        "/": (context) => HomePage(),
        "/customers": (context) => CustomerPage(),
        "/bills": (context) => BillsPage(),
        "/inventories": (context) => InventoriesPage(),
      },
    );
  }
}
