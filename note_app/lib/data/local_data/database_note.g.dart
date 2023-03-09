// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_note.dart';

// ignore_for_file: type=lint
class $NoteTableTable extends NoteTable with TableInfo<$NoteTableTable, Note> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
      'category_id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
      'date', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _noteContentMeta =
      const VerificationMeta('noteContent');
  @override
  late final GeneratedColumn<String> noteContent = GeneratedColumn<String>(
      'note_content', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isNoteMeta = const VerificationMeta('isNote');
  @override
  late final GeneratedColumn<bool> isNote =
      GeneratedColumn<bool>('is_note', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_note" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns =>
      [id, categoryId, category, date, title, noteContent, address, isNote];
  @override
  String get aliasedName => _alias ?? 'note';
  @override
  String get actualTableName => 'note';
  @override
  VerificationContext validateIntegrity(Insertable<Note> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('note_content')) {
      context.handle(
          _noteContentMeta,
          noteContent.isAcceptableOrUnknown(
              data['note_content']!, _noteContentMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('is_note')) {
      context.handle(_isNoteMeta,
          isNote.isAcceptableOrUnknown(data['is_note']!, _isNoteMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Note map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Note(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}category_id']),
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      noteContent: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}note_content']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      isNote: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_note']),
    );
  }

  @override
  $NoteTableTable createAlias(String alias) {
    return $NoteTableTable(attachedDatabase, alias);
  }
}

class NoteTableCompanion extends UpdateCompanion<Note> {
  final Value<int?> id;
  final Value<int?> categoryId;
  final Value<String?> category;
  final Value<String?> date;
  final Value<String?> title;
  final Value<String?> noteContent;
  final Value<String?> address;
  final Value<bool?> isNote;
  const NoteTableCompanion({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.category = const Value.absent(),
    this.date = const Value.absent(),
    this.title = const Value.absent(),
    this.noteContent = const Value.absent(),
    this.address = const Value.absent(),
    this.isNote = const Value.absent(),
  });
  NoteTableCompanion.insert({
    this.id = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.category = const Value.absent(),
    this.date = const Value.absent(),
    this.title = const Value.absent(),
    this.noteContent = const Value.absent(),
    this.address = const Value.absent(),
    this.isNote = const Value.absent(),
  });
  static Insertable<Note> custom({
    Expression<int>? id,
    Expression<int>? categoryId,
    Expression<String>? category,
    Expression<String>? date,
    Expression<String>? title,
    Expression<String>? noteContent,
    Expression<String>? address,
    Expression<bool>? isNote,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (categoryId != null) 'category_id': categoryId,
      if (category != null) 'category': category,
      if (date != null) 'date': date,
      if (title != null) 'title': title,
      if (noteContent != null) 'note_content': noteContent,
      if (address != null) 'address': address,
      if (isNote != null) 'is_note': isNote,
    });
  }

  NoteTableCompanion copyWith(
      {Value<int?>? id,
      Value<int?>? categoryId,
      Value<String?>? category,
      Value<String?>? date,
      Value<String?>? title,
      Value<String?>? noteContent,
      Value<String?>? address,
      Value<bool?>? isNote}) {
    return NoteTableCompanion(
      id: id ?? this.id,
      categoryId: categoryId ?? this.categoryId,
      category: category ?? this.category,
      date: date ?? this.date,
      title: title ?? this.title,
      noteContent: noteContent ?? this.noteContent,
      address: address ?? this.address,
      isNote: isNote ?? this.isNote,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (noteContent.present) {
      map['note_content'] = Variable<String>(noteContent.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (isNote.present) {
      map['is_note'] = Variable<bool>(isNote.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteTableCompanion(')
          ..write('id: $id, ')
          ..write('categoryId: $categoryId, ')
          ..write('category: $category, ')
          ..write('date: $date, ')
          ..write('title: $title, ')
          ..write('noteContent: $noteContent, ')
          ..write('address: $address, ')
          ..write('isNote: $isNote')
          ..write(')'))
        .toString();
  }
}

class $TodoTableTable extends TodoTable with TableInfo<$TodoTableTable, Todo> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _taskMeta = const VerificationMeta('task');
  @override
  late final GeneratedColumn<String> task = GeneratedColumn<String>(
      'task', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isCompletedMeta =
      const VerificationMeta('isCompleted');
  @override
  late final GeneratedColumn<bool> isCompleted =
      GeneratedColumn<bool>('is_completed', aliasedName, true,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintsDependsOnDialect({
            SqlDialect.sqlite: 'CHECK ("is_completed" IN (0, 1))',
            SqlDialect.mysql: '',
            SqlDialect.postgres: '',
          }));
  @override
  List<GeneratedColumn> get $columns => [id, task, isCompleted];
  @override
  String get aliasedName => _alias ?? 'todo';
  @override
  String get actualTableName => 'todo';
  @override
  VerificationContext validateIntegrity(Insertable<Todo> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('task')) {
      context.handle(
          _taskMeta, task.isAcceptableOrUnknown(data['task']!, _taskMeta));
    }
    if (data.containsKey('is_completed')) {
      context.handle(
          _isCompletedMeta,
          isCompleted.isAcceptableOrUnknown(
              data['is_completed']!, _isCompletedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  Todo map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Todo(
      task: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}task']),
      isCompleted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_completed']),
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id']),
    );
  }

  @override
  $TodoTableTable createAlias(String alias) {
    return $TodoTableTable(attachedDatabase, alias);
  }
}

class TodoTableCompanion extends UpdateCompanion<Todo> {
  final Value<int?> id;
  final Value<String?> task;
  final Value<bool?> isCompleted;
  const TodoTableCompanion({
    this.id = const Value.absent(),
    this.task = const Value.absent(),
    this.isCompleted = const Value.absent(),
  });
  TodoTableCompanion.insert({
    this.id = const Value.absent(),
    this.task = const Value.absent(),
    this.isCompleted = const Value.absent(),
  });
  static Insertable<Todo> custom({
    Expression<int>? id,
    Expression<String>? task,
    Expression<bool>? isCompleted,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (task != null) 'task': task,
      if (isCompleted != null) 'is_completed': isCompleted,
    });
  }

  TodoTableCompanion copyWith(
      {Value<int?>? id, Value<String?>? task, Value<bool?>? isCompleted}) {
    return TodoTableCompanion(
      id: id ?? this.id,
      task: task ?? this.task,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (task.present) {
      map['task'] = Variable<String>(task.value);
    }
    if (isCompleted.present) {
      map['is_completed'] = Variable<bool>(isCompleted.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoTableCompanion(')
          ..write('id: $id, ')
          ..write('task: $task, ')
          ..write('isCompleted: $isCompleted')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseNote extends GeneratedDatabase {
  _$DatabaseNote(QueryExecutor e) : super(e);
  late final $NoteTableTable noteTable = $NoteTableTable(this);
  late final $TodoTableTable todoTable = $TodoTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [noteTable, todoTable];
}
