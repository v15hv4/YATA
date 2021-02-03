import 'package:flutter/material.dart';
import 'package:YATA/views/screens/todo.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(YATA());
}

class YATA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.transparent));

    return MaterialApp(
        title: 'YATA',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.green,
            accentColor: Colors.black,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Jost'),
        home: TodoScreen());
  }
}
