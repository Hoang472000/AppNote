import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/entity/note_entity.dart';
import '../../data/repository.dart';
import '../bloc_event.dart';
import '../bloc_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  Repository repository;

  NoteBloc({required this.repository}) : super(NoteState(listNote: [])) {
    on<GetListNote>(_getListNote);
    on<InsertOrUpdateNote>(_insertOrUpdateNote);
    on<DeleteNote>(_deleteNote);
    add(GetListNote(true));
  }

  FutureOr<void> _getListNote(
      GetListNote event, Emitter<NoteState> emit) async {
    List<Note> list = await repository.getListNote();
    emit(state.copyWith(listNote: list));
  }

  FutureOr<void> _insertOrUpdateNote(
      InsertOrUpdateNote event, Emitter<NoteState> emit) async {
    bool isOk = await repository.insertUpdateNote(event.note);
  }

  FutureOr<void> _deleteNote(DeleteNote event, Emitter<NoteState> emit) async {
    bool isOk = await repository.deleteNote(event.note);
  }
}

class NoteEvent extends BlocEvent {
  @override
  List<Object?> get props => [];
}

class GetListNote extends NoteEvent {
  final bool isRefreshList;

  GetListNote(this.isRefreshList);

  @override
  List<Object?> get props => [isRefreshList];
}

class InsertOrUpdateNote extends NoteEvent {
  final Note note;

  InsertOrUpdateNote(this.note);

  @override
  List<Object?> get props => [note];
}

class DeleteNote extends NoteEvent {
  final Note note;

  DeleteNote(this.note);

  @override
  List<Object?> get props => [note];
}

class NoteState extends BlocState {
  final List<Note> listNote;
  final bool isShowProgress;
  final bool isHasUpdateList;

  NoteState(
      {this.listNote = const [],
      this.isShowProgress = true,
      this.isHasUpdateList = false});

  NoteState copyWith(
      {List<Note>? listNote,
      bool? isShowProgress,
      int? currentPage,
      bool? isHasUpdateList}) {
    return NoteState(
        listNote: listNote ?? this.listNote,
        isShowProgress: isShowProgress ?? this.isShowProgress,
        isHasUpdateList: isHasUpdateList ?? this.isHasUpdateList);
  }

  @override
  List<Object?> get props => [listNote, isShowProgress, isHasUpdateList];
}
