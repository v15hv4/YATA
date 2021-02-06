import 'package:YATA/views/helpers/db_helper.dart';
import 'package:YATA/views/models/todo_model.dart';
import 'package:flutter/material.dart';

class AddTodoScreen extends StatefulWidget {
  final Todo todo;
  final Function updateTodoList;
  AddTodoScreen({this.todo, this.updateTodoList});

  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  DateTime _datetime = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.todo != null) {
      _title = widget.todo.title;
    }
  }

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_title);

      // Todo todo = Todo(title: _title, datetime: _datetime, completed: false);
      Todo todo = Todo(_title, _datetime, 0);
      if (widget.todo == null) {
        DatabaseHelper.instance.insertTodo(todo);
      } else {
        todo.id = widget.todo.id;
        DatabaseHelper.instance.updateTodo(todo);
      }

      widget.updateTodoList();
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
            width: double.infinity,
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(Icons.arrow_back)),
            ),
          ),
          Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                      style: TextStyle(fontSize: 18.0),
                      decoration: InputDecoration(
                          labelText: "Title",
                          labelStyle: TextStyle(fontSize: 18.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0))),
                      validator: (input) => input.trim().isEmpty
                          ? "Title can not be empty!"
                          : null,
                      onSaved: (input) => _title = input.trim(),
                      initialValue: _title),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Theme.of(context).accentColor,
                      ),
                      child: FlatButton(
                          onPressed: () => _submit(),
                          child: Text("Save",
                              style: TextStyle(color: Colors.white))),
                    ),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
