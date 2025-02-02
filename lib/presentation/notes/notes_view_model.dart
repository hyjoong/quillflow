import 'package:flutter/material.dart';
import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/domain/use_case/use_cases.dart';
import 'package:quillflow/presentation/notes/notes_event.dart';

enum NoteSortType {
  dateCreated,
  title,
  color,
}

class NotesState {
  final List<Note> notes;
  final NoteSortType sortType;

  NotesState({
    required this.notes,
    this.sortType = NoteSortType.dateCreated,
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

  NotesState _state = NotesState(notes: []);
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
    );
  }

  void _sortNotes(List<Note> notes) {
    notes.sort((a, b) {
      final aMillis = a.timestamp.toString().length > 13
          ? (a.timestamp / 1000).round()
          : a.timestamp;
      final bMillis = b.timestamp.toString().length > 13
          ? (b.timestamp / 1000).round()
          : b.timestamp;
      return -aMillis.compareTo(bMillis);
    });
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
