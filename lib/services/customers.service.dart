import 'package:ecom_app_flutter/models/customer.model.dart';

class CustomerService{
  List<Customer> listeCustomer(){
    return [
      Customer(name: "John Doe", email: "morokojeanr@gmail.com"),
      Customer(name: "KOFFI", email: "morokojeanr@gmail.com"),
      Customer(name: "KOUAME FRANCIS", email: "morokojeanr@gmail.com"),
      Customer(name: "ALBAN IVANOV", email: "morokojeanr@gmail.com"),
    ];
  }
}