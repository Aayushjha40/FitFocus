import 'package:fitness/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:fitness/pages/Login.dart';
import 'package:fitness/pages/GetStartHome.dart';
import 'package:fitness/pages/Register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => Getstarthome(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/blank': (context) => Home(),
      },
    );
  }
}






