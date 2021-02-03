import 'package:YATA/views/widgets/empty_appbar.dart';
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
    final formattedDate = "${now.day} ${now.month}";

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
          children: [
            Padding(
                padding: EdgeInsets.only(top: 24.0, left: 32.0),
                child: Text(
                  "To Do",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w500),
                )),
          ],
        ));
  }
}
