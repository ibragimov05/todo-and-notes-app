import 'package:flutter/material.dart';
import 'package:todo_and_notes/controllers/note_controller.dart';
import 'package:todo_and_notes/views/widgets/custom_icon_button.dart';
import 'package:todo_and_notes/views/widgets/note_alert_dialog.dart';

class CustomNoteContainer extends StatelessWidget {
  final int index;
  final NoteController noteController;

  const CustomNoteContainer({
    super.key,
    required this.index,
    required this.noteController,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: const Color(0xFFDFDBDB),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(noteController.notesList[index].noteTitle),
              Text(
                noteController.notesList[index].noteCreatedDate
                    .toString()
                    .split(' ')[0],
              ),
            ],
          ),
          Text(noteController.notesList[index].noteContent),
          Row(
            children: [
              CustomIconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => NotesAlertDialog(
                        noteController: noteController,
                        isEdit: true,
                        index: index,
                      ),
                    );
                  },
                  icon: Icons.edit),
              CustomIconButton(
                onPressed: () {
                  noteController.deleteNote(noteIndex: index);
                },
                icon: Icons.delete,
              ),
            ],
          )
        ],
      ),
    );
  }
}
