import 'dart:convert';

//import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_app/data/local_data/database_note.dart';
import 'package:note_app/data/repository.dart';
import 'package:note_app/utils/logger.dart';

import 'entity/note_entity.dart';
import 'entity/todo.dart';
import 'fake_repository_impl.dart';

class RepositoryImpl with Repository {
  final FakeDataSource _fakeData = FakeDataSource();
  final bool isFakeData = FakeDataSource.isFake;

  //final dio = Dio();
  BuildContext context;

  RepositoryImpl({required this.context});

  @override
  Future<List<Note>> getListNote() async {
    List<Note> listNote = [];
    try {
      listNote = await DatabaseNote.instance.listNoteDB;
    } catch (e) {
      listNote = [];
    }
    return listNote;
  }

  @override
  Future<bool> deleteNote(Note note) async {
    //try {
      Logger.loggerDebug("Bkav HoangCV: note: ${note.toMap(note)}");
      return await DatabaseNote.instance.deleteNote(note);
    /*} catch (e) {
      Logger.loggerDebug("Bkav HoangCV: loi: E: $e");
      return false;
    }*/
  }

  @override
  Future<bool> insertUpdateNote(Note note) async {
    Logger.loggerDebug("Bkav HoangCV: note: ${note.toMap(note)}");
    try {

       await DatabaseNote.instance.insertUpdateNote(note);
       DatabaseNote.instance.insertListTodo(note.listTodo??[]);
        return true;
      //DatabaseNote.instance.
    } catch (e) {
      Logger.loggerDebug("Bkav HoangCV: e: $e");
      return false;
    }
  }
}
