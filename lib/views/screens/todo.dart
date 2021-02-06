import 'package:YATA/views/helpers/db_helper.dart';
import 'package:YATA/views/models/todo_model.dart';
import 'package:YATA/views/screens/add_todo.dart';
import 'package:YATA/views/widgets/empty_appbar.dart';
import 'package:YATA/views/widgets/todo_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  Future<List<Todo>> todoItems;

  updateTodoList() {
    setState(() {
      todoItems = DatabaseHelper.instance.getTodoList();
    });
  }

  @override
  void initState() {
    super.initState();
    updateTodoList();
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE, d MMMM').format(now);

    return Scaffold(
        appBar: EmptyAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AddTodoScreen(
                        updateTodoList: updateTodoList,
                      ))),
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            height: 50.0,
            color: Colors.black,
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
                width: double.infinity,
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 32.0, top: 28.0, bottom: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "To Do",
                          style: TextStyle(
                              fontSize: 42, fontWeight: FontWeight.w500),
                        ),
                        Text(formattedDate,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey))
                      ],
                    ))),
            Expanded(child: TodoList(todoItems, updateTodoList))
          ],
        ));
  }
}
