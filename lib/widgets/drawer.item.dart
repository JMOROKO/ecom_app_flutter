import 'package:flutter/material.dart';

// template du menu drawer
class DrawerItem extends StatelessWidget{
  final String title;
  final Icon itemIcon;
  final String route;

  DrawerItem({
    Key? key,
    required this.title,
    required this.itemIcon,
    required this.route
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: itemIcon,
      trailing: Icon(Icons.arrow_forward),
      title: Text("${title}"),
      onTap: () {
        // fermer le menu drawer
        Navigator.of(context).pop();
        // naviguer vers la route
        Navigator.pushNamed(context, "${route}");
      },
    );
  }
}