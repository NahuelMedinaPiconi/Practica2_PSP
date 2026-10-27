import 'package:flutter/material.dart';
import 'package:practica2/screens/HomePage.dart';
import 'package:practica2/screens/PersonalScreen.dart';
import 'package:practica2/screens/WidgetScreen.dart';

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
        "/" :(context) => HomePage(),
        "/edit" : (context) => PersonalPage(),
        "/widgets" : (context) => WidgetPage()
      }
    );
  }
}