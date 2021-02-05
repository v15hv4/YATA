import 'package:flutter/material.dart';

class AddTodoScreen extends StatefulWidget {
  @override
  _AddTodoScreenState createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  DateTime _datetime = DateTime.now();

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_title);

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
                          onPressed: () => null,
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
