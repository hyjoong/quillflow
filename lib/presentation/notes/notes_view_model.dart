import 'package:flutter/material.dart';
import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/domain/use_case/use_cases.dart';
import 'package:quillflow/presentation/notes/notes_event.dart';
import 'package:quillflow/presentation/notes/notes_state.dart';

class NotesState {
  final List<Note> notes;
  final NoteSortType sortType;

  NotesState({
    required this.notes,
    this.sortType = NoteSortType.dateDesc,
  });

  String getFormattedDate(int timestamp) {
    final milliseconds = timestamp.toString().length > 13
        ? (timestamp / 1000).round()
        : timestamp;
    final dateTime = DateTime.fromMillisecondsSinceEpoch(milliseconds);
    return '${dateTime.year}.${dateTime.month}.${dateTime.day} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  NotesState copyWith({
    List<Note>? notes,
    NoteSortType? sortType,
  }) {
    return NotesState(
      notes: notes ?? this.notes,
      sortType: sortType ?? this.sortType,
    );
  }
}

class NoteViewModel with ChangeNotifier {
  final UseCases useCases;

  NotesState _state = NotesState(notes: [], sortType: NoteSortType.dateDesc);
  NotesState get state => _state;

  Note? _recentlyDeletedNote;

  NoteViewModel(this.useCases) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
      changeSort: (sortType) async {
        await _changeSort(sortType);
      },
    );
  }

  void _sortNotes(List<Note> notes) {
    switch (_state.sortType) {
      case NoteSortType.dateDesc:
        notes.sort((a, b) {
          final aDate =
              DateTime.fromMillisecondsSinceEpoch(a.getNormalizedTimestamp());
          final bDate =
              DateTime.fromMillisecondsSinceEpoch(b.getNormalizedTimestamp());
          return bDate.compareTo(aDate);
        });
        break;
      case NoteSortType.dateAsc:
        notes.sort((a, b) {
          final aDate =
              DateTime.fromMillisecondsSinceEpoch(a.getNormalizedTimestamp());
          final bDate =
              DateTime.fromMillisecondsSinceEpoch(b.getNormalizedTimestamp());
          return aDate.compareTo(bDate);
        });

        break;
      case NoteSortType.titleAsc:
        notes.sort(
            (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));
        break;
      case NoteSortType.colorAsc:
        notes.sort((a, b) => a.color.compareTo(b.color));
        break;
    }
  }

  Future<void> _changeSort(NoteSortType sortType) async {
    _state = state.copyWith(sortType: sortType);
    List<Note> sortedNotes = List.from(_state.notes);
    _sortNotes(sortedNotes);
    _state = state.copyWith(notes: sortedNotes);
    notifyListeners();
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await useCases.getNotes();
    _sortNotes(notes);
    _state = state.copyWith(notes: notes);
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    try {
      await useCases.deleteNote(note);
      _recentlyDeletedNote = note;
      await _loadNotes();
    } catch (e) {
      throw Exception('Error deleting note: $e');
    }
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await useCases.addNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }
}
