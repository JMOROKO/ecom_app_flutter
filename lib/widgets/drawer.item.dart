import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerItem {
  final String title;
  final Icon itemIcon;
  final String route;

  DrawerItem({required this.title, required this.itemIcon, required this.route});

  build(BuildContext context) {
    return ListTile(
      leading: itemIcon,
      trailing: Icon(Icons.arrow_forward),
      title: Text(title),
      onTap: () {
        // fermer le menu drawer
        Navigator.of(context).pop();
        // naviguer vers la route
        Navigator.pushNamed(context, route);
      },
    );
  }
}