import 'package:coffe/controllers/BasicObject.dart';
import 'package:flutter/cupertino.dart';

class UserObject with ChangeNotifier implements BasicObject {
  int id = -1;
  String name = '';

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
