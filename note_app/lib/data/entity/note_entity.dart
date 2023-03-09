import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:note_app/data/entity/todo.dart';
import 'package:note_app/data/local_data/database_note.dart';

/// class Movie
class Note implements Insertable<Note> {
  final int? id;
  final int? categoryId;
  final String? category;
  final String? date;
  final String? title;
  final String? noteContent;
  final String? address;
  final List<Todo>? listTodo;
  final bool? isNote;

  Note(
      {this.id = 0,
      this.categoryId = 0,
      this.category = '',
      this.date = '',
      this.title = '',
      this.noteContent = '',
      this.address = '',
      this.isNote = false,
      this.listTodo});

  Note.copyWith(
    Note move,
  )   : id = move.id,
        categoryId = move.categoryId,
        category = move.category,
        date = move.date,
        title = move.title,
        noteContent = move.noteContent,
        address = move.address,
        isNote = move.isNote,
        listTodo = move.listTodo;

  Map<String, dynamic> toMap(Note note) {
    return {
      'categoryId': note.categoryId,
      'category': note.category,
      'date': note.date,
      'title': note.title,
      'noteContent': note.noteContent,
      'address': note.address,
      'isNote': note.isNote,
      // 'listTodo': jsonEncode(listTodo!.map((todo) => todo.toMap()).toList()),
    };
  }

  Note fromMap(Map<dynamic, dynamic> map) {
    return Note(
      categoryId: map['categoryId'],
      category: map['category'],
      date: map['date'],
      title: map['title'],
      noteContent: map['noteContent'],
      address: map['address'],
      isNote: map['isNote'],
      //listTodo: fromJsonList(jsonDecode(map['listTodo'])),
    );
  }

  List<Todo>? fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Todo.fromJson(json)).toList();
  }

  factory Note.fromData(Map<String, dynamic> data, GeneratedDatabase db) {
    final listTodo = (jsonDecode(data['listTodo']) as List<dynamic>)
        .map((e) => Todo.fromJson(e as Map<String, dynamic>))
        .toList();
    return Note(
      id: data['id'] as int,
      categoryId: data['categoryId'] as int,
      title: data['title'] as String,
      address: data['address'] as String,
      noteContent: data['noteContent'] as String,
      category: data['category'] as String,
      isNote: data['isNote'] as bool,
      listTodo: listTodo,
    );
  }

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return NoteTableCompanion(
      id: Value(id),
      categoryId: Value(categoryId),
      category: Value(category),
      date: Value(date),
      title: Value(title),
      noteContent: Value(noteContent),
      address: Value(address),
      isNote: Value(isNote),
    ).toColumns(nullToAbsent);
  }
}
