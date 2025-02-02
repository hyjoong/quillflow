import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/domain/repository/note_repository.dart';

class AddNoteUseCase {
  final NoteRepository repository;
  AddNoteUseCase(this.repository);
  Future<void> call(Note note) async {
    await repository.insertNote(note);
  }
}
