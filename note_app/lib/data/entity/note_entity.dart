import 'package:drift/drift.dart';
import 'package:note_app/data/local_data/database_note.dart';

/// class Movie
class Note implements Insertable<Note> {

  final int? categoryId;
  final String? category;
  final String? date;
  final String? title;
  final String? noteContent;
  final String? address;
  final bool? isNote;

  Note(
      {
      this.categoryId = 0,
      this.category = '',
      this.date = '',
      this.title = '',
      this.noteContent = '',
      this.address = '',
      this.isNote = false});

  Note.copyWith(
    Note move,
  )   :
        categoryId = move.categoryId,
        category = move.category,
        date = move.date,
        title = move.title,
        noteContent = move.noteContent,
        address = move.address,
        isNote = move.isNote;

  @override
  Map<String, Expression<Object>> toColumns(bool nullToAbsent) {
    return NoteTableCompanion(
            categoryId: Value(categoryId),
            category: Value(category),
            date: Value(date),
            title: Value(title),
            noteContent: Value(noteContent),
            address: Value(address),
            isNote: Value(isNote))
        .toColumns(nullToAbsent);
  }
}
