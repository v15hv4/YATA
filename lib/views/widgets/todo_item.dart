import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final Map item;
  TodoItem(this.item);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: ListTile(
        leading: item["completed"]
            ? Icon(Icons.check_circle, color: Colors.greenAccent[700])
            : Icon(
                Icons.radio_button_off,
                color: Colors.grey,
              ),
        title: Text(
          item["title"],
          style: TextStyle(
              fontSize: 20,
              color: item["completed"] ? Colors.grey[700] : Colors.black,
              decoration:
                  item["completed"] ? TextDecoration.lineThrough : null),
        ),
        onTap: () {},
      ),
    );
  }
}
