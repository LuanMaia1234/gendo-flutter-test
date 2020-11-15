import 'package:flutter/material.dart';
import 'package:gendofluttertest/screens/home_screen.dart';

void main() {
  runApp(GendoFlutterTest());
}
//Classe principal
class GendoFlutterTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gendo Flutter Test',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

