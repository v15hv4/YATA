import 'package:YATA/screens/todo.dart';
import 'package:flutter/material.dart';

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
          accentColor: Colors.greenAccent[400],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: TodoScreen());
  }
}
