import 'package:flutter_test/flutter_test.dart';
import 'package:quillflow/data/data_source/note_data_source.dart';
import 'package:quillflow/domain/model/note.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  test('db test', () async {
    final db =
        await databaseFactorySqflitePlugin.openDatabase(inMemoryDatabasePath);

    await db.execute(
        'CREATE TABLE note (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT, color: INTEGER, timestamp INTEGER');

    final noteDataSource = NoteDataSource(db);

    await noteDataSource.insertNote(
      const Note(
        title: 'title',
        content: 'content',
        color: 1,
        timestamp: 1,
      ),
    );

    expect((await noteDataSource.getNotes()).length, 1);

    Note note = (await noteDataSource.getNoteById(1))!;
    expect(note.id, 1);

    await db.close();
  });
}
