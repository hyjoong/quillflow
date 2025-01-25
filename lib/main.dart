import 'package:flutter/material.dart';
import 'package:quillflow/screen/notes_screen.dart';
import 'package:quillflow/ui/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuillFlow',
      theme: ThemeData(
        primaryColor: Colors.white,
        scaffoldBackgroundColor: darkGray,
        canvasColor: darkGray,
        floatingActionButtonTheme:
          Theme.of(context).floatingActionButtonTheme.copyWith(
            backgroundColor: lightBlue,
            foregroundColor: darkGray,
          ),
        appBarTheme: Theme.of(context).appBarTheme.copyWith(
          backgroundColor: darkGray,
        ),
      ),
      home: const NotesScreen(),
    );
  }
}
