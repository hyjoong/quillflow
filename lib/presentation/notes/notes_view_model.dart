import 'package:flutter/material.dart';
import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/domain/repository/note_repository.dart';
import 'package:quillflow/presentation/notes/notes_event.dart';
import 'package:quillflow/presentation/notes/notes_state.dart';

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
