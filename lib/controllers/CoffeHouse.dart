import 'package:coffe/controllers/BasicObject.dart';
import 'package:coffe/controllers/Product.dart';
import 'package:flutter/cupertino.dart';

class CoffeHouse with ChangeNotifier implements BasicObject {
  String name = '';
  String description = '';
  String address = '';
  String email = '';
  String phone = '';
  List<Product> products = [];
  @override
  bool flagOfBusy = false;

  @override
  void clearData() {
    // TODO: implement clearData
  }

  @override
  void onDataAccepted(data, controller) {
    // TODO: implement onDataAccepted
  }
}
