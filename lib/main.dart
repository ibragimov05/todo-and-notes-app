import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_and_notes/controllers/note_controller.dart';
import 'package:todo_and_notes/controllers/todo_controller.dart';
import 'package:todo_and_notes/notifiers/note_notifier.dart';
import 'package:todo_and_notes/notifiers/todo_notifier.dart';
import 'package:todo_and_notes/views/screens/main_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return TodoNotifier(
      todoController: TodoController(),
      child: NoteNotifier(
        noteController: NoteController(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainPage(),
        ),
      ),
    );
  }
}
