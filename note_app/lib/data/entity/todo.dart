import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:note_app/data/local_data/database_note.dart';

class Todo implements Insertable<Todo> {
  final int? id;

  final String? task;
  final bool? isCompleted;

  Todo({this.task = '', this.isCompleted = false, this.id});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': task,
      'isCompleted': isCompleted,
    };
  }

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      task: json['task'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'task': task,
      'isCompleted': isCompleted,
    };
  }

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return TodoTableCompanion(
            id: Value(id ?? 0),
            task: Value(task),
            isCompleted: Value(isCompleted))
        .toColumns(nullToAbsent);
  }
}
