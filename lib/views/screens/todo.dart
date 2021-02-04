import 'package:YATA/views/widgets/empty_appbar.dart';
import 'package:YATA/views/widgets/todo_list.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formattedDate = DateFormat('EEEE, d MMMM').format(now);

    return Scaffold(
        appBar: EmptyAppBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).accentColor,
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Container(
            height: 60.0,
            color: Colors.black,
          ),
        ),
        body: Column(
          children: <Widget>[
            SizedBox(
                width: double.infinity,
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 24.0, top: 24.0, bottom: 12.0),
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
                    ))),
            Expanded(
              child: TodoList(),
            )
          ],
        ));
  }
}
