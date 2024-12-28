import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/domain/repository/note_repository.dart';
import 'package:quillflow/presentation/notes/notes_event.dart';

class NoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  List<Note> _notes = [];
  UnmodifiableListView<Note> get notes => UnmodifiableListView(_notes);

  Note? _recentlyDeletedNote;

  NoteViewModel(this.repository);

  void onEvent(NotesEvent event) {
    event.when(
      loadNotes: () {},
      deleteNote: (note) {},
      restoreNote: () {},
    );
  }

  Future<void> _loadNotes() async {
    List<Note> notes = await repository.getNotes();
    _notes = notes;
    notifyListeners();
  }

  Future<void> _deleteNote(Note note) async {
    await repository.deleteNoteById(note.id!);
    _recentlyDeletedNote = note;
    await _loadNotes();
  }

  Future<void> _restoreNote() async {
    if (_recentlyDeletedNote != null) {
      await repository.insertNote(_recentlyDeletedNote!);
      _recentlyDeletedNote = null;

      _loadNotes();
    }
  }
}
