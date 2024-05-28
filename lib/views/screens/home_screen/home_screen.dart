import 'package:flutter/material.dart';
import 'package:todo_and_notes/controllers/note_controller.dart';
import 'package:todo_and_notes/controllers/todo_controller.dart';
import 'package:todo_and_notes/notifiers/note_notifier.dart';
import 'package:todo_and_notes/notifiers/todo_notifier.dart';
import 'package:todo_and_notes/views/widgets/custom_task_container.dart';
import 'package:todo_and_notes/views/widgets/todo_alert_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TodoController todoController = TodoNotifier.of(context);
    return NoteNotifier(
      noteController: NoteController(),
      child: ListenableBuilder(
        listenable: todoController,
        builder: (BuildContext context, Widget? child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('To-Do'),
              centerTitle: false,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return TodoAlertDialog(
                            todoController: todoController,
                            isEdit: false,
                            index: 0,
                          );
                        },
                      );
                    },
                    child: const Text('Add todo'),
                  ),
                ),
              ],
            ),

            /// showing text called add todo if there is no todo in list
            body: todoController.todosList.isEmpty
                ? const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Add ToDo'),
                      ],
                    ),
                  )

                /// showing user tasks
                : ListView.builder(
                    itemCount: todoController.todosList.length,
                    itemBuilder: (context, index) {
                      return CustomTaskContainer(
                        todoController: todoController,
                        index: index,
                      );
                    },
                  ),
          );
        },
      ),
    );
  }
}
