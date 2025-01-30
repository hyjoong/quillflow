import 'package:flutter/material.dart';
import 'package:quillflow/domain/model/note.dart';
import 'package:provider/provider.dart';
import 'package:quillflow/presentation/notes/notes_view_model.dart';

class NoteItem extends StatelessWidget {
  final Note note;
  final Function onDeleteTap;

  const NoteItem({
    super.key,
    required this.note,
    required this.onDeleteTap,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<NoteViewModel>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(note.color),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  note.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Expanded(
                  child: Text(
                    note.content,
                    maxLines: 6,
                    overflow: TextOverflow.fade,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(height: 1.5),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  viewModel.state.getFormattedDate(note.timestamp),
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: GestureDetector(
              onTap: () {
                onDeleteTap.call();
              },
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.delete, size: 20),
              ),
            ),
          )
        ],
      ),
    );
  }
}
