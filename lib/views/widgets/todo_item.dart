import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final int index;
  final Map item;
  final Function toggleCompleted;

  TodoItem(this.index, this.item, this.toggleCompleted);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
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
              fontSize: 18,
              color: item["completed"] ? Colors.grey[700] : Colors.black,
              decoration:
                  item["completed"] ? TextDecoration.lineThrough : null),
        ),
        onTap: () {
          toggleCompleted(index);
        },
      ),
    );
  }
}
