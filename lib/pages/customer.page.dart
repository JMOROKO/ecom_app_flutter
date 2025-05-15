import 'package:ecom_app_flutter/models/customer.model.dart';
import 'package:ecom_app_flutter/services/customers.service.dart';
import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget{

  const CustomerPage({super.key});


  @override
  CustomerHomeViewState createState() => CustomerHomeViewState();
}

class CustomerHomeViewState extends State<CustomerPage>{

  List<Customer> clients = [];

  // recuperer la liste des clients à partir du service
  //List<Customer> clients = CustomerService().listeCustomer();

  @override
  void initState() {
    getAllCustomer();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer liste'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body:
      clients.length == 0 ?
      Center(
        child: Text("Veuillez d'abord ajouter un client."),
      ) :
      ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: clients.length ?? 0,
        itemBuilder: (context, index) {
          final client = clients[index];
          return
            Card(
              elevation: 2.0,
              margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).primaryColor, //Colors.blue,
                  child: Text(
                    client.name[0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(
                  client.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(client.email),
                  ],
                ),
                onTap: () {
                  // lors du clic je veux lancer un appel téléphonique au client
                  // Action lors du clic sur un client
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Client: ${client.name}')),
                  );
                },
              ),
            );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to perform when the button is pressed
        },
        child: Icon(Icons.add),
      ),
    );
  }

  getAllCustomer() async{
    clients = await CustomerService().getAllCustomer();
    setState(() {
      //clients = customers!;
    });
  }
}