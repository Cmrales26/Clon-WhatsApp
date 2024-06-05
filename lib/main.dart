import 'package:flutter/material.dart';
import 'package:whastsapp/Screens/Homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF0b131a),
        hintColor: const Color(0xFF21c064),
        cardColor: const Color(0xFF1f2c33),
        fontFamily: "OpenSans",
      ),
      home: const Home(),
    );
  }
}
