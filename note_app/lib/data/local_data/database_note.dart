import 'dart:io';
import 'package:note_app/data/local_data/table/note_table.dart';
import 'package:path/path.dart' as p;
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

import '../entity/note_entity.dart';

// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'database_note.g.dart';

@DriftDatabase(tables: [NoteTable])
class DatabaseNote extends _$DatabaseNote {
  DatabaseNote._internal() : super(_openConnection());

  static final DatabaseNote instance = DatabaseNote._internal();

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;

  Future<List<Note>> get listNoteDB => select(noteTable).get();

  ///insert all nếu đã có trong DB thì update
  void insertListNote(List<Note> values) {
    batch((batch) {
      batch.insertAllOnConflictUpdate(noteTable, values);
    });
  }

  Future insertUpdateNote(Note value) {
   return into(noteTable).insertOnConflictUpdate(value);
  }

  Future deleteNote(Note value) {
    return (delete(noteTable)
        ..where((tbl) => tbl.category.contains(value.category??""))).go();
  }
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db_movie.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}
