import 'package:provider/single_child_widget.dart';
import 'package:provider/provider.dart';
import 'package:quillflow/data/data_source/note_data_source.dart';
import 'package:quillflow/data/repository/note_repository_impl.dart';
import 'package:quillflow/domain/repository/note_repository.dart';
import 'package:quillflow/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:quillflow/presentation/notes/notes_view_model.dart';
import 'package:sqflite/sqflite.dart';

Future<List<SingleChildWidget>> getProviders() async {
  Database database = await openDatabase(
    'note_db',
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color INTEGER, timestamp INTEGER)');
    },
  );
  NoteDataSource noteDataSource = NoteDataSource(database);
  NoteRepository repository = NoteRepositoryImpl(noteDataSource);
  NoteViewModel noteViewModel = NoteViewModel(repository);
  AddEditNoteViewModel addEditNoteViewModel = AddEditNoteViewModel(repository);

  return [
    ChangeNotifierProvider(create: (_)=>noteViewModel),
    ChangeNotifierProvider(create: (_)=>addEditNoteViewModel),
  ];
}
