import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/domain/repository/note_repository.dart';

class UpdateNote {
  final NoteRepository repository;
  UpdateNote(this.repository);

  Future<void> call(Note note) async {
    await repository.updateNote(note);
  }
}
