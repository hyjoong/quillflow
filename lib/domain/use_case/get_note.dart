import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/domain/repository/note_repository.dart';

class GetNote {
  final NoteRepository repository;

  GetNote(this.repository);
  Future<Note?> call(int id) async {
    return await repository.getNoteById(id);
  }
}
