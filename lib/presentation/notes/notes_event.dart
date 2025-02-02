import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/presentation/notes/notes_state.dart';

part 'notes_event.freezed.dart';

@freezed
abstract class NotesEvent with _$NotesEvent {
  const factory NotesEvent.loadNotes() = LoadNotes;
  const factory NotesEvent.deleteNote(Note note) = DeleteNote;
  const factory NotesEvent.restoreNote() = RestoreNote;
  const factory NotesEvent.changeSort(NoteSortType sortType) = ChangeSort;
}
