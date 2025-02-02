import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/domain/repository/note_repository.dart';

class DeleteNoteUseCase {
  final NoteRepository repository;
  DeleteNoteUseCase(this.repository);
  Future<void> call(Note note) async {
    await repository.deleteNoteById(note.id!);
  }
}
