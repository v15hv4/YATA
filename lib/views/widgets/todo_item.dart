import 'package:YATA/views/helpers/db_helper.dart';
import 'package:YATA/views/models/todo_model.dart';
import 'package:YATA/views/screens/add_todo.dart';
import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final int index;
  final Todo item;
  final updateTodoList;

  TodoItem(this.index, this.item, this.updateTodoList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 4.0),
      child: ListTile(
        leading: Checkbox(
          onChanged: (value) {
            item.completed = value ? 1 : 0;
            DatabaseHelper.instance.updateTodo(item);
            updateTodoList();
          },
          activeColor: Colors.greenAccent[700],
          value: item.completed == 1,
        ),
        title: Text(
          item.title,
          style: TextStyle(
              fontSize: 18,
              color: item.completed == 1 ? Colors.grey[700] : Colors.black,
              decoration:
                  item.completed == 1 ? TextDecoration.lineThrough : null),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    AddTodoScreen(updateTodoList: updateTodoList, todo: item))),
      ),
    );
  }
}
