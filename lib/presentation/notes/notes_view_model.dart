import 'package:flutter/material.dart';
import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/domain/repository/note_repository.dart';
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
  final NoteRepository repository;

  NotesState _state = NotesState(notes: []);
  NotesState get state => _state;

  Note? _recentlyDeletedNote;

  NoteViewModel(this.repository) {
    _loadNotes();
  }

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: _loadNotes,
      deleteNote: _deleteNote,
      restoreNote: _restoreNote,
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await repository.getNotes();
    _state = state.copyWith(
      notes: notes,
    );
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    try {
      await repository.deleteNoteById(note.id!);
      _recentlyDeletedNote = note;
      final updatedNotes = await repository.getNotes();
      _state = state.copyWith(notes: updatedNotes);
      notifyListeners();
    } catch (e) {
      print('Error deleting note: $e');
    }
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await repository.insertNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }
}
