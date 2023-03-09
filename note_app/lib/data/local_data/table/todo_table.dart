import 'package:drift/drift.dart';

import '../../entity/todo.dart';


@UseRowClass(Todo)
class TodoTable extends Table {
  @override
  String get tableName => 'todo';
  IntColumn get id => integer().nullable()();

  TextColumn get task => text().nullable()();

  BoolColumn get isCompleted => boolean().nullable()();

/*  @override
  Set<Column>? get primaryKey => {id};*/
}