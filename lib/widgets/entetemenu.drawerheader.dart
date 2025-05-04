import 'package:flutter/material.dart';

class EnteteMenuDrawerHeader extends StatelessWidget{
  const EnteteMenuDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            // backgroundColor: Colors.red,
            backgroundImage: AssetImage("assets/logo/reactiv.png"),
            radius: 60,
          ),
          Text("Menu application")
        ],
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.white,
            Theme.of(context).primaryColor,
          ],
        ),
      ),
    );
  }
}