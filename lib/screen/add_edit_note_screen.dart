import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quillflow/domain/model/note.dart';
import 'package:quillflow/presentation/add_edit_note/add_edit_note_event.dart';
import 'package:quillflow/presentation/add_edit_note/add_edit_note_view_model.dart';
import 'package:quillflow/presentation/notes/notes_event.dart';
import 'package:quillflow/presentation/notes/notes_view_model.dart';
import 'package:quillflow/ui/colors.dart';
import 'package:provider/provider.dart';

class AddEditNoteScreen extends StatefulWidget {
  final Note? note;

  const AddEditNoteScreen({
    super.key,
    this.note,
  });

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  StreamSubscription? _streamSubscription;

  final List<Color> noteColors = [
    mint,
    peach,
    lavender,
    sage,
    coral,
    powder,
  ];

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<AddEditNoteViewModel>();

    if (widget.note != null) {
      _titleController.text = widget.note!.title;
      _contentController.text = widget.note!.content;
      // 초기 상태 저장
      Future.microtask(() {
        viewModel.initializeNote(widget.note);
      });
    } else {
      // 새 노트인 경우 초기화
      Future.microtask(() {
        viewModel.initializeNote(null);
      });
    }

    Future.microtask(() {
      final viewModel = context.read<AddEditNoteViewModel>();

      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(
          saveNote: () {},
          showSnackBar: (String message) {
            final snackBar = SnackBar(content: Text(message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          },
        );
      });
    });

    _titleController.addListener(() {
      setState(() {});
    });
    _contentController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    _titleController.dispose();
    _contentController.dispose();
    _titleController.removeListener(() {});
    _contentController.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<AddEditNoteViewModel>();

    return Scaffold(
      backgroundColor: Color(viewModel.color),
      body: SafeArea(
        child: PopScope(
          canPop: false,
          onPopInvoked: (didPop) async {
            if (didPop) {
              return;
            }

            if (!viewModel.isNoteChanged(
                _titleController.text, _contentController.text)) {
              Navigator.pop(context);
              return;
            }

            final result = await showDialog<bool>(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('메모 저장'),
                    content: const Text('작성한 메모를 저장하시겠습니까?'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text(
                          '저장 안 함',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context, true),
                        child: const Text('저장'),
                      ),
                    ],
                  ),
                ) ??
                false;

            if (result) {
              final viewModel = context.read<AddEditNoteViewModel>();
              await viewModel.onBackPressed(
                widget.note?.id,
                _titleController.text,
                _contentController.text,
              );
              if (mounted) {
                Navigator.pop(context, true);
              }
            } else {
              Navigator.pop(context);
            }
          },
          child: Column(
            children: [
              _buildHeader(),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.95),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Color(viewModel.color).withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      _buildColorPicker(),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              TextField(
                                controller: _titleController,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                                decoration: InputDecoration(
                                  hintText: '제목',
                                  hintStyle: TextStyle(
                                      color: darkGray.withOpacity(0.5)),
                                  border: InputBorder.none,
                                ),
                              ),
                              const Divider(height: 20),
                              Expanded(
                                child: TextField(
                                  controller: _contentController,
                                  maxLines: null,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                  decoration: InputDecoration(
                                    hintText: '여기에 내용을 입력하세요...',
                                    hintStyle: TextStyle(
                                        color: darkGray.withOpacity(0.5)),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildColorPicker() {
    final viewModel = context.watch<AddEditNoteViewModel>();
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: noteColors.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final color = noteColors[index];
          return GestureDetector(
            onTap: () {
              viewModel.onEvent(AddEditNoteEvent.changeColor(color.value));
            },
            child: Container(
              width: 45,
              height: 45,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
                border: Border.all(
                  color: viewModel.color == color.value
                      ? darkGray
                      : Colors.transparent,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.4),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: viewModel.color == color.value
                  ? const Icon(Icons.check, color: darkGray)
                  : null,
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader() {
    final bool hasContent =
        _titleController.text.isNotEmpty || _contentController.text.isNotEmpty;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () async {
              final viewModel = context.read<AddEditNoteViewModel>();
              await viewModel.onBackPressed(
                widget.note?.id,
                _titleController.text,
                _contentController.text,
              );
              if (mounted) {
                Navigator.pop(context, true);
              }
            },
          ),
          const Expanded(
            child: Text(
              '노트 작성',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            width: 80,
            child: widget.note != null
                ? _buildDeleteButton()
                : AnimatedOpacity(
                    duration: const Duration(milliseconds: 200),
                    opacity: hasContent ? 1.0 : 0.0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(8),
                          onTap: hasContent
                              ? () async {
                                  final viewModel =
                                      context.read<AddEditNoteViewModel>();
                                  await viewModel.onBackPressed(
                                    widget.note?.id,
                                    _titleController.text,
                                    _contentController.text,
                                  );
                                  if (mounted) {
                                    Navigator.pop(context, true);
                                  }
                                }
                              : null,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 8),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.check,
                                  color: darkGray,
                                  size: 20,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  '완료',
                                  style: TextStyle(
                                    color: darkGray,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeleteButton() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('노트 삭제'),
                content: const Text('이 노트를 삭제하시겠습니까?'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      '취소',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      final viewModel = context.read<NoteViewModel>();
                      viewModel.onEvent(NotesEvent.deleteNote(widget.note!));
                      Navigator.pop(context);
                      Navigator.pop(context, true);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('노트가 삭제되었습니다.'),
                          action: SnackBarAction(
                            label: '실행취소',
                            textColor: Colors.white,
                            onPressed: () {
                              viewModel.onEvent(const NotesEvent.restoreNote());
                            },
                          ),
                          backgroundColor: Colors.red[400],
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          margin: const EdgeInsets.all(16),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[600],
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      '삭제',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8), // 마지막 버튼 오른쪽 여백
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                actionsPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.delete_outline,
                  color: Colors.red[700],
                  size: 20,
                ),
                const SizedBox(width: 4),
                Text(
                  '삭제',
                  style: TextStyle(
                    color: Colors.red[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
