class Todo {
  int id;
  String title;
  DateTime datetime;
  bool completed;

  Todo(this.title, this.datetime, this.completed);
  Todo.withId({this.id, this.title, this.datetime, this.completed});

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map["id"] = id;
    }
    map["title"] = title;
    map["datetime"] = datetime.toIso8601String();
    map["completed"] = completed;
    return map;
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo.withId(
        id: map["id"],
        title: map["title"],
        datetime: DateTime.parse(map["datetime"]),
        completed: map["completed"]);
  }
}
