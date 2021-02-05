import 'package:YATA/views/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final _todoItems = [
      {
        "title":
            "Some very long text that overflows qwertyuiop asdfghjkl zxcvbnm",
        "completed": true,
        "timestamp": DateTime.now()
      },
      {"title": "Two", "completed": false, "timestamp": DateTime.now()},
      {"title": "Three", "completed": false, "timestamp": DateTime.now()},
      {"title": "Four", "completed": false, "timestamp": DateTime.now()},
      {"title": "Five", "completed": false, "timestamp": DateTime.now()},
      {"title": "Six", "completed": false, "timestamp": DateTime.now()},
      {"title": "Seven", "completed": false, "timestamp": DateTime.now()},
      {"title": "Eight", "completed": false, "timestamp": DateTime.now()},
      {"title": "Nine", "completed": false, "timestamp": DateTime.now()},
      {"title": "Ten", "completed": false, "timestamp": DateTime.now()},
      {"title": "Eleven", "completed": false, "timestamp": DateTime.now()},
      {"title": "Twelve", "completed": false, "timestamp": DateTime.now()},
      {"title": "Thirteen", "completed": false, "timestamp": DateTime.now()},
      {"title": "Fourteen", "completed": false, "timestamp": DateTime.now()},
      {"title": "Fifteen", "completed": false, "timestamp": DateTime.now()},
    ];

    void toggleCompleted(int idx) {
      setState(() {
        _todoItems[idx]["completed"] = !_todoItems[idx]["completed"];
      });
    }

    return ListView.builder(
      itemCount: _todoItems.length + 1,
      itemBuilder: (context, index) {
        if (index == _todoItems.length) {
          return SizedBox(height: 50.0);
        }
        return TodoItem(index, _todoItems[index], toggleCompleted);
      },
    );
  }
}
