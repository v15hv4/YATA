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
        if (index == _todoItems.length) {
          return SizedBox(height: 100.0);
        }
        return TodoItem(_todoItems[index]);
      },
    );
  }
}
