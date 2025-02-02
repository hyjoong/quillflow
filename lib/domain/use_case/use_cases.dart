import 'package:quillflow/domain/use_case/add_note_use_case.dart';
import 'package:quillflow/domain/use_case/delete_note_use_case.dart';
import 'package:quillflow/domain/use_case/get_note_use_case.dart';
import 'package:quillflow/domain/use_case/get_notes_use_case.dart';
import 'package:quillflow/domain/use_case/update_note_use_case.dart';

class UseCases {
  final AddNoteUseCase addNote;
  final DeleteNoteUseCase deleteNote;
  final GetNotesUseCase getNotes;
  final GetNoteUseCase getNoteU;
  final UpdateNoteUseCase updateNote;

  UseCases({
    required this.addNote,
    required this.deleteNote,
    required this.getNotes,
    required this.getNoteU,
    required this.updateNote,
  });
}
