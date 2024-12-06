import 'package:quillflow/data/data_source/note_data_source.dart';
import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/domain/repository/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDataSource db;

  NoteRepositoryImpl(this.db);

  @override
  Future<void> deleteNoteById(int id) async {
    await db.deleteNoteById(id);
  }

  @override
  Future<Note?> getNoteById(int id) async {
    return await db.getNoteById(id);
  }

  @override
  Future<List<Note>> getNotes() async {
    return await db.getNotes();
  }

  @override
  Future<void> insertNote(Note note) async {
    await db.insertNote(note);
  }

  @override
  Future<void> updateNote( Note note) async {
    await db.updateNote( note);
  }
}
