import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/domain/repository/note_repository.dart';
import 'package:quillflow/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:quillflow/presentation/add_edit_note/add_edit_note_ui_event.dart';
import 'package:quillflow/ui/colors.dart';

class AddEditNoteViewModel with ChangeNotifier {
  final NoteRepository repository;

  int _color = mint.value;
  int get color => _color;

  final _eventController = StreamController<AddEditNoteUiEvent>.broadcast();

  Stream<AddEditNoteUiEvent> get eventStream => _eventController.stream;

  AddEditNoteViewModel(this.repository);

  void onEvent(AddEditNoteEvent event) {
    event.when(
      changeColor: _changeColor,
      saveNote: _saveNote,
    );
  }

  Future<void> _changeColor(int color) async {
    _color = color;
    notifyListeners();
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    if (title.isEmpty && content.isEmpty) {
      return;
    }

    final currentTime = DateTime.now().millisecondsSinceEpoch;
    String finalTitle = title;
    String finalContent = content;

    if (title.isEmpty && content.isNotEmpty) {
      finalTitle = content.split('\n')[0];
      if (finalTitle.length > 50) {
        finalTitle = '${finalTitle.substring(0, 47)}...';
      }
      finalContent = content;
    }

    if (id == null) {
      await repository.insertNote(Note(
        title: finalTitle,
        content: finalContent,
        color: _color,
        timestamp: currentTime,
      ));
    } else {
      await repository.updateNote(Note(
        id: id,
        title: finalTitle,
        content: finalContent,
        color: _color,
        timestamp: currentTime,
      ));
    }

    _eventController.add(const AddEditNoteUiEvent.saveNote());
  }
}
