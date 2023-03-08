import 'package:drift/drift.dart';

import '../../entity/note_entity.dart';


@UseRowClass(Note)
class NoteTable extends Table {
  @override
  String get tableName => 'note';

  IntColumn get categoryId => integer().nullable()();

  TextColumn get category => text().nullable()();

  TextColumn get date => text().nullable()();

  TextColumn get title => text().nullable()();

  TextColumn get noteContent => text().nullable()();

  TextColumn get address => text().nullable()();

  BoolColumn get isNote => boolean().nullable()();

/*  @override
  Set<Column>? get primaryKey => {id};*/
}
