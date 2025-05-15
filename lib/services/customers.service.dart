import 'dart:convert';

import 'package:ecom_app_flutter/models/customer.model.dart';
import 'package:http/http.dart';

class CustomerService{
 // au lieu de localhost il faut utiliser l'adresse IP de la machine
  static const String baseURL = "http://192.168.1.50:8888/";
  static const String customerURL = "CUSTOMER-SERVICE/api/";
  static const String customerListURL = "customers";

  List<Customer> listeCustomer() {
    return [
      Customer(
        id: 1,
        name: "John Doe",
        email: "morokojeanr@hotmail.com"
      )
    ];
  }

  Future<List<Customer>> getAllCustomer() async{
    final uri = Uri.parse(baseURL + customerURL + customerListURL);
    final call = await get(uri);
    print('Status code: ${call.statusCode}');
    Map<String, dynamic> data = json.decode(call.body);
    List<dynamic> customersJson = data['_embedded']['customers'];
    List<Customer> customers = customersJson.map<Customer>( (json) => Customer.fromJson(json) ).toList();
    //print(customers);
    return customers;
  }
  Future<int> countAllCustomer() async{
    final uri = Uri.parse(baseURL + customerURL + customerListURL);
    final call = await get(uri);
    print('Status code count customer: ${call.statusCode}');
    Map<String, dynamic> data = json.decode(call.body);
    List<dynamic> customersJson = data['_embedded']['customers'];
    List<Customer> customers = customersJson.map<Customer>( (json) => Customer.fromJson(json) ).toList();
    int nbrCustomer = customers.length;
    return nbrCustomer;
  }
}