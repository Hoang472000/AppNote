import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/data/entity/category.dart';
import 'package:note_app/utils/logger.dart';
import '../../data/entity/note_entity.dart';
import '../../data/repository.dart';
import '../bloc_event.dart';
import '../bloc_state.dart';

class CreateOrEditBloc extends Bloc<CreateOrEditEvent, CreateOrEditState> {
  Repository repository;

  CreateOrEditBloc({required this.repository})
      : super(CreateOrEditState(listNote: [])) {
    on<GetListNote>(_getListNote);
    on<InsertOrUpdateNote>(_insertOrUpdateNote);
    on<ChangeCategory>(_changeCategory);
    on<OnChangeDateTime>(_onChangeDateTime);
    on<OnChangeString>(_onChangeString);
    add(GetListNote(true));
  }

  FutureOr<void> _getListNote(
      GetListNote event, Emitter<CreateOrEditState> emit) async {
    Note note = Note(
        categoryId: 0, category: "Công việc", date: DateTime.now().toString(), isNote: false);
    List<Category> listCategory = [
      Category(0, "Công việc"),
      Category(1, "Học tập"),
      Category(2, "Riêng tư"),
    ];
    List<String> listString = ["Không hẹn giờ","Nhắc trước 5 phút"];
    emit(state.copyWith(
        note: note, listCategory: listCategory, category: listCategory[0], listString: listString));
    List<Note> list = await repository.getListNote();
    emit(state.copyWith(listNote: list, isShowProgress: false));
  }

  FutureOr<void> _insertOrUpdateNote(
      InsertOrUpdateNote event, Emitter<CreateOrEditState> emit) async {
    bool isOk = await repository.insertUpdateNote(state.note ?? Note());
    Logger.loggerDebug("HoangCV: _insertOrUpdateNote: ${isOk}");
  }

  FutureOr<void> _changeCategory(
      ChangeCategory event, Emitter<CreateOrEditState> emit) async {
    Note note = Note(
        categoryId: event.category.categoryId,
        category: event.category.category,
        date: (state.note ?? Note()).date,
        address: (state.note ?? Note()).address,
        noteContent: (state.note ?? Note()).noteContent,
        isNote: (state.note ?? Note()).isNote,
        title: (state.note ?? Note()).title);
    emit(state.copyWith(note: note));
  }

  FutureOr<void> _onChangeDateTime(
      OnChangeDateTime event, Emitter<CreateOrEditState> emit) {
    Note note = Note(
        categoryId: (state.note ?? Note()).categoryId,
        category: (state.note ?? Note()).category,
        date: event.dateTime,
        address: (state.note ?? Note()).address,
        noteContent: (state.note ?? Note()).noteContent,
        isNote: (state.note ?? Note()).isNote,
        title: (state.note ?? Note()).title);
    emit(state.copyWith(note: note));
  }

  FutureOr<void> _onChangeString(
      OnChangeString event, Emitter<CreateOrEditState> emit) {
    Note note = Note(
        categoryId: (state.note ?? Note()).categoryId,
        category: (state.note ?? Note()).category,
        date: (state.note ?? Note()).date,
        address: (state.note ?? Note()).address,
        noteContent: (state.note ?? Note()).noteContent,
        isNote: event.note.compareTo(state.listString[0]) == 0 ? true : false,
        title: (state.note ?? Note()).title);
    emit(state.copyWith(note: note));
  }
}

class CreateOrEditEvent extends BlocEvent {
  @override
  List<Object?> get props => [];
}

class GetListNote extends CreateOrEditEvent {
  final bool isRefreshList;

  GetListNote(this.isRefreshList);

  @override
  List<Object?> get props => [isRefreshList];
}

class InsertOrUpdateNote extends CreateOrEditEvent {
  final Note note;

  InsertOrUpdateNote(this.note);

  @override
  List<Object?> get props => [note];
}

class ChangeCategory extends CreateOrEditEvent {
  final Category category;

  ChangeCategory(this.category);

  @override
  List<Object?> get props => [category];
}

class OnChangeDateTime extends CreateOrEditEvent {
  final String dateTime;

  OnChangeDateTime(this.dateTime);

  @override
  List<Object?> get props => [dateTime];
}

class OnChangeString extends CreateOrEditEvent {
  final String note;

  OnChangeString(this.note);

  @override
  List<Object?> get props => [note];
}

class CreateOrEditState extends BlocState {
  final List<Note> listNote;
  final bool isShowProgress;
  final bool isHasUpdateList;
  final Note? note;
  final List<Category> listCategory;
  final Category? category;
  final List<String> listString;

  CreateOrEditState(
      {this.listNote = const [],
      this.isShowProgress = false,
      this.isHasUpdateList = false,
      this.note,
      this.listCategory = const [],
      this.category,
      this.listString = const []});

  CreateOrEditState copyWith(
      {List<Note>? listNote,
      bool? isShowProgress,
      int? currentPage,
      bool? isHasUpdateList,
      Note? note,
      List<Category>? listCategory,
      Category? category,
      List<String>? listString}) {
    return CreateOrEditState(
        listNote: listNote ?? this.listNote,
        isShowProgress: isShowProgress ?? this.isShowProgress,
        isHasUpdateList: isHasUpdateList ?? this.isHasUpdateList,
        note: note ?? this.note,
        listCategory: listCategory ?? this.listCategory,
        category: category ?? this.category,
        listString: listString ?? this.listString);
  }

  @override
  List<Object?> get props => [
        listNote,
        isShowProgress,
        isHasUpdateList,
        note,
        listCategory,
        category,
        listString
      ];
}
