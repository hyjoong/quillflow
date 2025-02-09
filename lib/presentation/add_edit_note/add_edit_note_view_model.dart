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
  String? _initialTitle;
  String? _initialContent;
  int? _initialColor;

  int get color => _color;

  final _eventController = StreamController<AddEditNoteUiEvent>.broadcast();
  Stream<AddEditNoteUiEvent> get eventStream => _eventController.stream;

  AddEditNoteViewModel(this.repository);

  void initializeNote(Note? note) {
    if (note != null) {
      _initialTitle = note.title;
      _initialContent = note.content;
      _initialColor = note.color;
      _color = note.color;
      notifyListeners();
    } else {
      _initialTitle = null;
      _initialContent = null;
      _initialColor = mint.value;
      _color = mint.value;
      notifyListeners();
    }
  }

  bool isNoteChanged(String title, String content) {
    if (_initialTitle == null || _initialContent == null) {
      // 새 노트인 경우
      return title.isNotEmpty || content.isNotEmpty;
    }
    // 기존 노트인 경우 - 제목, 내용, 색상 중 하나라도 변경되었는지 확인
    return title != _initialTitle ||
        content != _initialContent ||
        _color != _initialColor;
  }

  void onEvent(AddEditNoteEvent event) {
    event.when(
      changeColor: (color) {
        _color = color;
        notifyListeners();
      },
      saveNote: _saveNote,
    );
  }

  Future<void> _saveNote(int? id, String title, String content) async {
    // 변경사항이 없으면 저장하지 않음
    if (!isNoteChanged(title, content)) {
      _eventController.add(const AddEditNoteUiEvent.saveNote());
      return;
    }

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
