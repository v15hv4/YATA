import 'package:flutter/material.dart';
import 'package:YATA/views/screens/todo.dart';

void main() {
  runApp(YATA());
}

class YATA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'YATA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green,
            accentColor: Colors.greenAccent[700],
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Jost'),
        home: TodoScreen());
  }
}
