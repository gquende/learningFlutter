import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:learn/Bloc/home.dart';
import 'package:learn/models/item.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Learning Flutter',
        debugShowCheckedModeBanner: false, //Para elminar o simbolo do Debug
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home());
  }
}
