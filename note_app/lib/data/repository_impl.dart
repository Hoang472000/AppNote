import 'dart:convert';

//import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:note_app/data/local_data/database_note.dart';
import 'package:note_app/data/repository.dart';

import 'entity/note_entity.dart';
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
    try {
      return await DatabaseNote.instance.deleteNote(note);
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> insertUpdateNote(Note note) async {
    try {
      return await DatabaseNote.instance.insertUpdateNote(note);
    } catch (e) {
      return false;
    }
  }
}
