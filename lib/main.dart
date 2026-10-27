import 'package:flutter/material.dart';
import 'package:practica2/screens/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Practica",
      initialRoute: "/",
      routes: {
        "/" :(context) => HomePage()
      }
    );
  }
}