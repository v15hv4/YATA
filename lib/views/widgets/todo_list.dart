import 'package:YATA/views/models/todo_model.dart';
import 'package:YATA/views/widgets/todo_item.dart';
import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  final Future<List<Todo>> todoItems;
  final Function updateTodoList;
  TodoList(this.todoItems, this.updateTodoList);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    // final todoItems = [
    //   {
    //     "title":
    //         "Some very long text that overflows qwertyuiop asdfghjkl zxcvbnm",
    //     "completed": true,
    //     "datetime": DateTime.now()
    //   },
    //   {"title": "Two", "completed": false, "datetime": DateTime.now()},
    //   {"title": "Three", "completed": false, "datetime": DateTime.now()},
    //   {"title": "Four", "completed": false, "datetime": DateTime.now()},
    //   {"title": "Five", "completed": false, "datetime": DateTime.now()},
    //   {"title": "Six", "completed": false, "datetime": DateTime.now()},
    //   {"title": "Seven", "completed": false, "datetime": DateTime.now()},
    //   {"title": "Eight", "completed": false, "datetime": DateTime.now()},
    //   {"title": "Nine", "completed": false, "datetime": DateTime.now()},
    //   {"title": "Ten", "completed": false, "datetime": DateTime.now()},
    //   {"title": "Eleven", "completed": false, "datetime": DateTime.now()},
    //   {"title": "Twelve", "completed": false, "datetime": DateTime.now()},
    //   {"title": "Thirteen", "completed": false, "datetime": DateTime.now()},
    //   {"title": "Fourteen", "completed": false, "datetime": DateTime.now()},
    //   {"title": "Fifteen", "completed": false, "datetime": DateTime.now()},
    // ];

    // void toggleCompleted(int idx) {
    //   setState(() {
    //     todoItems[idx]["completed"] = !todoItems[idx]["completed"];
    //   });
    // }

    return FutureBuilder(
        future: widget.todoItems,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data.length + 1,
            itemBuilder: (context, index) {
              if (index == snapshot.data.length) {
                return SizedBox(height: 50.0);
              }
              return TodoItem(
                  index, snapshot.data[index], widget.updateTodoList);
            },
          );
        });
  }
}
