import 'package:flutter/material.dart';
import 'package:todo_and_notes/controllers/todo_controller.dart';

class TodoAlertDialog extends StatefulWidget {
  final TodoController todoController;
  final bool isEdit;
  final int index;

  const TodoAlertDialog({
    super.key,
    required this.todoController,
    required this.isEdit,
    required this.index,
  });

  @override
  State<TodoAlertDialog> createState() => _TodoAlertDialogState();
}

class _TodoAlertDialogState extends State<TodoAlertDialog> {
  final List<TextEditingController> _controllers = [
    TextEditingController(),
    TextEditingController(),
  ];

  String error = '';

  @override
  void dispose() {
    _controllers[0].dispose();
    _controllers[1].dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.isEdit ? 'Edit To-Do' : 'Add To-Do'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(error),
          TextField(
            decoration: const InputDecoration(hintText: 'ToDo title'),
            controller: _controllers[0],
          ),
          TextField(
            decoration: const InputDecoration(hintText: 'ToDo content'),
            controller: _controllers[1],
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_controllers[0].text.isNotEmpty &&
                _controllers[1].text.isNotEmpty) {
              if (!widget.isEdit) {
                widget.todoController.addTodo(
                  todoId: widget.todoController.todosList.length + 1,
                  todoTitle: _controllers[0].text,
                  todoContent: _controllers[1].text,
                );
              } else {
                widget.todoController.editTodo(
                  todoIndex: widget.index,
                  todoTitle: _controllers[0].text,
                  todoContent: _controllers[1].text,
                );
              }

              Navigator.of(context).pop();
            } else {
              error = 'error: fill all fields!';
              setState(() {});
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
