import 'package:drift/drift.dart';

import '../../entity/note_entity.dart';
import '../../entity/todo.dart';

@UseRowClass(Note)
class NoteTable extends Table {
  @override
  String get tableName => 'note';

  IntColumn get id => integer().nullable()();

  IntColumn get categoryId => integer().nullable()();

  TextColumn get category => text().nullable()();

  TextColumn get date => text().nullable()();

  TextColumn get title => text().nullable()();

  TextColumn get noteContent => text().nullable()();

  TextColumn get address => text().nullable()();

  BoolColumn get isNote => boolean().nullable()();

  //TextColumn get listTodo => text().map(const TodoConverter()).nullable()();
  @override
  Set<Column>? get primaryKey => {id};
}
