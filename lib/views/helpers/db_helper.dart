import 'dart:io';

import 'package:YATA/views/models/todo_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database _db;
  DatabaseHelper._instance();

  String todoTable = 'todo_table';
  String colId = 'id';
  String colTitle = 'title';
  String colDateTime = 'datetime';
  String colCompleted = 'completed';

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db;
  }

  Future<Database> _initDb() async {
    Directory dir = await getApplicationDocumentsDirectory();
    String path = dir.path + "todo_list.db";
    final todoListDb =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return todoListDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE $todoTable($colId INTEGER PRIMARY KEY AUTOINCREMENT, $colTitle TEXT NOT NULL, $colDateTime TEXT, $colCompleted BOOLEAN)");
  }

  Future<List<Map<String, dynamic>>> getTodoMapList() async {
    Database db = await this.db;
    final List<Map<String, dynamic>> res = await db.query(todoTable);
    return res;
  }

  Future<List<Todo>> getTodoList() async {
    final List<Map<String, dynamic>> todoMapList = await getTodoMapList();
    final List<Todo> todoList = [];
    todoMapList.forEach((todoMap) {
      todoList.add(Todo.fromMap(todoMap));
    });
    return todoList;
  }

  Future<int> insertTodo(Todo todo) async {
    Database db = await this.db;
    final int res = await db.insert(todoTable, todo.toMap());
    return res;
  }

  Future<int> updateTodo(Todo todo) async {
    Database db = await this.db;
    final int res = await db.update(todoTable, todo.toMap(),
        where: '$colId = ?', whereArgs: [todo.id]);
    return res;
  }
}
