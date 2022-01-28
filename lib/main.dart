// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import "./Home.dart";
import "./Restaurant.dart";
import "./Food.dart";

void main() {
  runApp(Start());
}

class Start extends StatefulWidget {
  const Start({Key? key}) : super(key: key);

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/home",
      routes: {
        "/home": (context) => Home(),
        "/restaurant": (context) => Restaurant(),
        "/food": (context) => Food(),
      },
    );
  }
}
