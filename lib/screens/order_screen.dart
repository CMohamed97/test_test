import 'package:flutter/material.dart';
import 'package:restaurant_app/components/home_components.dart';
import 'package:restaurant_app/models/menu.dart';
import 'package:restaurant_app/screens/order_done.dart';

List<Map> orders = [];

class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Orders'),
        actions: [
          FlatButton(
            child: Text('Done'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) {
                  return OrderDoneScreen();
                }),
              );
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (_, i) {
          Menu menu = orders[i]['menu'];
          return MenuItem(
            menu: menu,
            ref: () {
              setState(() {});
            },
          );
        },
      ),
    );
  }
}
