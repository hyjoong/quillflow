import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/domain/repository/note_repository.dart';

class AddNote {
  final NoteRepository repository;
  AddNote(this.repository);
  Future<void> call(Note note) async {
    await repository.insertNote(note);
  }
}
