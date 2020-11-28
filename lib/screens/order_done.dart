import 'package:flutter/material.dart';
import 'package:restaurant_app/models/menu.dart';
import 'package:restaurant_app/utils/size.dart';
import 'order_screen.dart';

class OrderDoneScreen extends StatefulWidget {
  @override
  _OrderDoneScreenState createState() => _OrderDoneScreenState();
}

class _OrderDoneScreenState extends State<OrderDoneScreen> {
  int totalPrice = 0;

  String contene = '';

  List<int> controllers = [];

  @override
  void initState() {
    orders.forEach((menu) {
      controllers.add(1);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    totalPrice = 0;
    for (int i = 0; i < orders.length; i++) {
      contene = orders[i]['menu'].name + ' + ' + contene;
      totalPrice = totalPrice + orders[i]['menu'].price * controllers[i];
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Order Done"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Container(
              // height: height * 0.8,
              child: ListView.builder(
                itemCount: orders.length,
                itemBuilder: (BuildContext context, int index) {
                  Menu order = orders[index]['menu'];
                  return ListTile(
                    title:
                        Text('${orders[index]['rest'].name} : ${order.name}'),
                    subtitle: Text('price: ${order.price}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              controllers[index]++;
                            });
                          },
                        ),
                        Text('${controllers[index]}'),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            if (controllers[index] > 1) {
                              setState(() {
                                controllers[index]--;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          // SizedBox(height: height * 0.03),
          Expanded(
            child: Container(
              color: Theme.of(context).primaryColor,
              child: Center(child: Text("Total price = $totalPrice")),
            ),
          ),
        ],
      ),
    );
  }
}
