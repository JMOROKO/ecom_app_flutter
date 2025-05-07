import 'package:ecom_app_flutter/models/customer.model.dart';
import 'package:ecom_app_flutter/services/customers.service.dart';
import 'package:flutter/material.dart';

class CustomerPage extends StatelessWidget{

  CustomerPage({super.key});

  // recuperer la liste des clients à partir du service
  List<Customer> clients = CustomerService().listeCustomer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer liste'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: clients.length,
        itemBuilder: (context, index) {
          final client = clients[index];
          return Card(
            elevation: 2.0,
            margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.blue,
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
}