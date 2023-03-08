

import 'package:note_app/data/repository.dart';

import 'entity/note_entity.dart';

class FakeDataSource extends Repository {
  static bool get isFake => false;

  @override
  Future<List<Note>> getListNote() {
    // TODO: implement getListMove
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteNote(Note note) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<bool> insertUpdateNote(Note note) {
    // TODO: implement insertNote
    throw UnimplementedError();
  }
}
