import 'package:YATA/views/widgets/todo_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE, d MMMM').format(now);

    final _todoItems = [
      {"title": "One"},
      {"title": "Two"},
      {"title": "Three"},
      {"title": "Four"},
      {"title": "Five"},
      {"title": "Five"},
      {"title": "Five"},
      {"title": "Five"},
      {"title": "Five"},
      {"title": "Five"},
      {"title": "Five"},
      {"title": "Five"},
      {"title": "Five"},
      {"title": "Five"},
      {"title": "Five"},
    ];

    return ListView.builder(
      itemCount: _todoItems.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return SizedBox(
              width: double.infinity,
              child: Padding(
                  padding: EdgeInsets.only(left: 24.0, top: 24.0, bottom: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "To Do",
                        style: TextStyle(
                            fontSize: 48, fontWeight: FontWeight.w500),
                      ),
                      Text(formattedDate,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey))
                    ],
                  )));
        } else if (index == _todoItems.length) {
          return SizedBox(height: 100.0);
        }
        return TodoItem(_todoItems[index]);
      },
    );
  }
}
