import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final Map item;

  TodoItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 18.0),
      child: Container(
        child: Text(item["title"]),
        height: 60,
        color: Colors.blue,
      ),
    );
  }
}
