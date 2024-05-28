import 'package:flutter/material.dart';
import 'package:todo_and_notes/controllers/todo_controller.dart';
import 'package:todo_and_notes/views/widgets/custom_icon_button.dart';
import 'package:todo_and_notes/views/widgets/todo_alert_dialog.dart';

class CustomTaskContainer extends StatelessWidget {
  final int index;
  final TodoController todoController;

  const CustomTaskContainer(
      {super.key, required this.index, required this.todoController});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  todoController.toggleDone(todoId: index);
                },
                icon: Icon(
                  todoController.todosList[index].isDone
                      ? Icons.check_circle
                      : Icons.circle,
                ),
              ),
              Text('id: ${todoController.todosList[index].todoId}'),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todoController.todosList[index].todoTitle),
                  Text(todoController.todosList[index].todoCreatedDate
                      .toString()
                      .split(' ')[0]),
                ],
              ),
            ],
          ),
          Text(todoController.todosList[index].todoContent),
          Row(
            children: [
              CustomIconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => TodoAlertDialog(
                      todoController: todoController,
                      isEdit: true,
                      index: index,
                    ),
                  );
                },
                icon: Icons.edit,
              ),
              CustomIconButton(
                onPressed: () {
                  todoController.deleteTodo(todoIndex: index);
                },
                icon: Icons.delete,
              ),
            ],
          ),
        ],
      ),
    );
  }


}
