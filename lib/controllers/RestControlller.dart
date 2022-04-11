import 'dart:convert';
import 'dart:io';
import 'package:coffe/controllers/BasicObject.dart';
import 'package:http/http.dart' as http;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

Map map = {
  'client_registration': "/client/registration",
  'client_login': "/client/login",
  'client_get_profile': "/client/getProfile",
  'client_get_passport': "/client/getPassport",
  'client_update_profile': "/client/updateProfile",
  3: "Sam"
};

class RestController {
  static String fileInBase64({uri}) {
    return base64Encode(File(uri).readAsBytesSync());
  }

  static init() async {
    await Hive.initFlutter();
  }

  static send_request(
      {required BasicObject class_obj,
      required String controller,
      required data}) async {
    class_obj.flagOfBusy = true;

    String address = 'http://192.168.0.105:5050';
    String url = address + map[controller].toString();
    try {
      // Код, который может привести к генерации исключения

      final response = await http.post(Uri.parse(url),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: data);

      if (response.statusCode == 200) {
        class_obj.flagOfBusy = false;
        print('Ответ ' + response.body);
        var box = await Hive.openBox('myBox');
        // If the server did return a 201 CREATED response,
        // then parse the JSON.
        box.put(url, response.body);
        return class_obj.onDataAccepted(response.body, controller);
      } else {
        var box = await Hive.openBox('myBox');
        class_obj.flagOfBusy = false;

        var resp = box.get(url);
        print('Кэш ' + resp);
        class_obj.onDataAccepted(resp, controller);

        // If the server did not return a 201 CREATED response,
        // then throw an exception.
        throw Exception('Error of Internet connection');
      }
    } catch (e) {
      var box = await Hive.openBox('myBox');
      var resp = box.get(url);
      print('Исключение' + e.toString());
      print('Кэш ' + resp);
      class_obj.onDataAccepted(resp, controller);
    }
  }
}
