import 'package:ecom_app_flutter/widgets/drawer.item.dart';
import 'package:flutter/material.dart';

class MenuDrawerWidget extends StatelessWidget{
  const MenuDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerItem(
              title: "Accueil",
              itemIcon: Icon(
                  Icons.home,
                  color: Theme.of(context).primaryColor,
                ),
              route: "/"
          ),
          Divider(
            height: 0.5,
            color: Theme.of(context).primaryColor,
          ),
          DrawerItem(
              title: "Customer",
              itemIcon: Icon(
                Icons.verified_user,
                color: Theme.of(context).primaryColor,
              ),
              route: "/customer"
          ),
          Divider(
            height: 0.5,
            color: Theme.of(context).primaryColor,
          ),
          DrawerItem(
              title: "Bills",
              itemIcon: Icon(
                Icons.list_alt,
                color: Theme.of(context).primaryColor,
              ),
              route: "/bills"
          ),
          Divider(
            height: 0.5,
            color: Theme.of(context).primaryColor,
          ),
          DrawerItem(
              title: "Inventories",
              itemIcon: Icon(
                Icons.inventory,
                color: Theme.of(context).primaryColor,
              ),
              route: "/inventories"
          ),
        ],
      ),
    );
  }
}