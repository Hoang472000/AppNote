import 'dart:async';

import 'entity/note_entity.dart';

abstract class Repository {
  Future<List<Note>> getListNote();

  Future<bool> insertUpdateNote(Note note);

  Future<bool> deleteNote(Note note);
}
