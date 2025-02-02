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
    if (title.isEmpty || content.isEmpty) {
      _eventController
          .add(const AddEditNoteUiEvent.showSnackBar('제목이나 내용이 비어 있습니다'));
      return;
    }

    final currentTime = DateTime.now().millisecondsSinceEpoch;

    if (id == null) {
      await repository.insertNote(Note(
        title: title,
        content: content,
        color: _color,
        timestamp: currentTime,
      ));
    } else {
      await repository.updateNote(Note(
        id: id,
        title: title,
        content: content,
        color: _color,
        timestamp: currentTime,
      ));
    }

    _eventController.add(const AddEditNoteUiEvent.saveNote());
  }
}
