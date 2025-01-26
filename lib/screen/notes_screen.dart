import 'package:flutter/material.dart';
import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/screen/add_edit_note_screen.dart';
import 'package:quillflow/presentation/notes/components/note_item.dart';
import 'package:quillflow/ui/colors.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My note'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddEditNoteScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            NoteItem(
              note: Note(
                title: 'title',
                content: 'content',
                color: mint.value,
                timestamp: 1,
              ),
            ),
            NoteItem(
              note: Note(
                title: 'title 2',
                content: 'content',
                color: mint.value,
                timestamp: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
