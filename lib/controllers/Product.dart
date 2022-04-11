import 'package:coffe/controllers/BasicObject.dart';
import 'package:flutter/cupertino.dart';

class Product with ChangeNotifier implements BasicObject {
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
