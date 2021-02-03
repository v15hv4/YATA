import 'package:YATA/views/widgets/empty_appbar.dart';
import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
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
            height: 70.0,
            color: Colors.black,
          ),
        ),
        body: Column(
          children: [
            Padding(
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 32.0),
                child: Text(
                  "To Do",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.w500),
                )),
          ],
        ));
  }
}
