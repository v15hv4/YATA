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
        "datetime": DateTime.now()
      },
      {"title": "Two", "completed": false, "datetime": DateTime.now()},
      {"title": "Three", "completed": false, "datetime": DateTime.now()},
      {"title": "Four", "completed": false, "datetime": DateTime.now()},
      {"title": "Five", "completed": false, "datetime": DateTime.now()},
      {"title": "Six", "completed": false, "datetime": DateTime.now()},
      {"title": "Seven", "completed": false, "datetime": DateTime.now()},
      {"title": "Eight", "completed": false, "datetime": DateTime.now()},
      {"title": "Nine", "completed": false, "datetime": DateTime.now()},
      {"title": "Ten", "completed": false, "datetime": DateTime.now()},
      {"title": "Eleven", "completed": false, "datetime": DateTime.now()},
      {"title": "Twelve", "completed": false, "datetime": DateTime.now()},
      {"title": "Thirteen", "completed": false, "datetime": DateTime.now()},
      {"title": "Fourteen", "completed": false, "datetime": DateTime.now()},
      {"title": "Fifteen", "completed": false, "datetime": DateTime.now()},
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
