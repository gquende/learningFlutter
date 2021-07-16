import 'dart:async';
import 'package:flutter/material.dart';

class HomeBloc {
  int counter = 0;
  final StreamController _streamController = StreamController();

  Sink get input => _streamController.sink;
  Stream get output => _streamController.stream;

  void increment() {
    counter++;
    input.add(counter);
  }
}
