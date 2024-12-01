import 'package:quillflow/domain/model/note.dart';

abstract class NoteRepository {
  Future<List<Note>> getNotes();
  Future<Note?> getNoteById(int id);
  Future<void> insertNote(Note note);
  Future<void> updateNoteById(int id, Note note);
  Future<void> deleteNoteById(int id);
}