import 'package:flutter/material.dart';
import 'package:quillflow/presentation/notes/notes_event.dart';
import 'package:quillflow/presentation/notes/notes_view_model.dart';
import 'package:quillflow/screen/add_edit_note_screen.dart';
import 'package:quillflow/presentation/notes/components/note_item.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NoteViewModel>();
    final state = viewModel.state;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          '내 메모',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w800,
            color: Colors.grey[800],
            letterSpacing: -0.5,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: Row(
              children: [
                const SizedBox(width: 12),
                _buildActionButton(
                  icon: Icons.sort_rounded,
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Container(
        height: 65,
        width: 65,
        decoration: BoxDecoration(
          color: const Color(0xFF4B68FF),
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: FloatingActionButton(
          onPressed: () async {
            // isSaved가 false면 뒤로가기, true면 저장버튼을 누른 경우
            bool? isSaved = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AddEditNoteScreen(),
              ),
            );
            if (isSaved != null && isSaved) {
              viewModel.onEvent(const NotesEvent.loadNotes());
            }
          },
          backgroundColor: Colors.transparent,
          elevation: 0,
          child: const Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 0.85,
          ),
          itemCount: state.notes.length,
          itemBuilder: (context, index) {
            final note = state.notes[index];
            return NoteItem(
              note: note,
              onDeleteTap: () {
                viewModel.onEvent(NotesEvent.deleteNote(note));
                final snackBar = SnackBar(
                  content: const Text('노트가 삭제되었습니다.'),
                  action: SnackBarAction(
                    label: '취소',
                    onPressed: () {
                      viewModel.onEvent(const NotesEvent.restoreNote());
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(15),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Icon(
              icon,
              color: Colors.grey[700],
              size: 26,
            ),
          ),
        ),
      ),
    );
  }
}
