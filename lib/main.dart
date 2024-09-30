import 'package:flutter/material.dart';
import 'pages/LoginPage.dart';
import 'pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu Makanan App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // Setup routing
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
