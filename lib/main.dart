import 'package:flutter/material.dart';
import 'package:to_do/homePage.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName:(BuildContext)=>HomePage()
      },
    );
  }
}
