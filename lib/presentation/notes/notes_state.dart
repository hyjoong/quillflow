import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quillflow/domain/model/note.dart';

part 'notes_state.freezed.dart';
part 'notes_state.g.dart';

enum NoteSortType {
  dateDesc('최신순'),
  dateAsc('오래된순'),
  titleAsc('제목순'),
  colorAsc('색상순');

  final String label;
  const NoteSortType(this.label);
}

@freezed
class NotesState with _$NotesState {
  factory NotesState({
    required List<Note> notes,
    @Default(NoteSortType.dateDesc) NoteSortType sortType,
  }) = _NotesState;

  factory NotesState.fromJson(Map<String, dynamic> json) =>
      _$NotesStateFromJson(json);
}
