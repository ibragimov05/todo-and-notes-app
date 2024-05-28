import 'package:flutter/material.dart';
import 'package:todo_and_notes/controllers/note_controller.dart';
import 'package:todo_and_notes/notifiers/note_notifier.dart';
import 'package:todo_and_notes/views/widgets/custom_note_container.dart';
import 'package:todo_and_notes/views/widgets/note_alert_dialog.dart';

class NoteScreen extends StatelessWidget {
  const NoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NoteController noteController = NoteNotifier.of(context);
    return ListenableBuilder(
      listenable: noteController,
      builder: (BuildContext context, Widget? child) => Scaffold(
        appBar: AppBar(
          title: const Text('Your notes'),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => NotesAlertDialog(
                      noteController: noteController,
                      isEdit: false,
                      index: 0,
                    ),
                  );
                },
                child: const Text('Add note'),
              ),
            ),
          ],
        ),
        body: noteController.notesList.isEmpty
            ? const Center(
                child: Text('Add notes'),
              )
            : ListView.builder(
                itemCount: noteController.notesList.length,
                itemBuilder: (context, index) {
                  return CustomNoteContainer(
                    index: index,
                    noteController: noteController,
                  );
                },
              ),
      ),
    );
  }
}
