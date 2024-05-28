import 'package:flutter/material.dart';
import 'package:todo_and_notes/controllers/note_controller.dart';

class NoteNotifier extends InheritedWidget {
  final NoteController noteController;

  const NoteNotifier({
    super.key,
    required this.noteController,
    required super.child,
  });

  @override
  bool updateShouldNotify(covariant NoteNotifier oldWidget) {
    return oldWidget.noteController != noteController;
  }

  static NoteController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<NoteNotifier>()!
        .noteController;
  }
}
