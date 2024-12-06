import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/domain/repository/note_repository.dart';

class DeleteNote {
  final NoteRepository repository;
  DeleteNote(this.repository);
  Future<void> call(Note note) async {
  }
}