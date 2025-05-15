import 'package:ecom_app_flutter/services/customers.service.dart';
import 'package:flutter/material.dart';

import '../widgets/menu.drawer.widget.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});



  @override
  HomePageState createState() => HomePageState();

}

class HomePageState extends State<HomePage> with WidgetsBindingObserver {
  int nbrCustomer = -1;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    countCustomer();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      // L'application a repris le premier plan
      countCustomer();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawerWidget(),
      appBar: AppBar(
        title: Text("Accueil"),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Clients',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue[900],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${nbrCustomer}',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Factures',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[900],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${0}',
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[900],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  countCustomer() async{
    final nbr = await CustomerService().countAllCustomer();
    setState(() {
      nbrCustomer = nbr;
    });
  }
}