import 'package:flutter/material.dart';
import 'package:restaurant_app/screens/home_screen.dart';
import 'package:restaurant_app/utils/size.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant App',
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (_) => HomeScreen(),
      },
    );
  }
}
