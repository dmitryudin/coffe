import 'package:coffe/controllers/BasicObject.dart';
import 'package:flutter/cupertino.dart';

class Coffe with ChangeNotifier implements BasicObject {
  int id = -1;
  String name = '';
  String description = '';
  String composition = '';
  double price = 0.0;
  int quantity = 0;

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
