import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < 30; i++) {
      widgets.add(Card(
          child: Column(children: [
        CachedNetworkImage(
            imageUrl:
                'https://www.thespruceeats.com/thmb/iYCclWmk5rE1gLdE--uYELPhTL4=/5760x3840/filters:no_upscale():max_bytes(150000):strip_icc()/fancy-raspberry-mousse-cake-dessert-462334687-813bea322cfb4b3184cad39f2b201072.jpg'),
        //Text('nothing'),
        ListTile(
          tileColor: Colors.orange,
          title: Text(
            "Очень вкусная штучка",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ])));
    }
    // TODO: implement build
    return Scaffold(body: GridView.count(crossAxisCount: 2, children: widgets));
  }
}
