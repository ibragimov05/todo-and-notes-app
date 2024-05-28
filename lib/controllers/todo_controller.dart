import 'package:flutter/cupertino.dart';
import 'package:todo_and_notes/models/todo_model.dart';

class TodoController with ChangeNotifier {
  final List<TodoModel> _todosList = [];

  List<TodoModel> get todosList => [..._todosList];

  void addTodo({
    required int todoId,
    required String todoTitle,
    required String todoContent,
  }) {
    _todosList.add(
      TodoModel(
        todoId: _todosList.length,
        todoTitle: todoTitle,
        todoContent: todoContent,
        todoCreatedDate: DateTime.now(),
        isDone: false,
      ),
    );
    notifyListeners();
  }

  void editTodo({
    required int todoIndex,
    required String todoTitle,
    required String todoContent,
  }) {
    _todosList[todoIndex].todoTitle = todoTitle;
    _todosList[todoIndex].todoContent = todoContent;
    notifyListeners();
  }

  void deleteTodo({
    required int todoIndex,
  }) {
    _todosList.removeAt(todoIndex);
    notifyListeners();
  }

  void toggleDone({required int todoId}) {
    for (int i = 0; i < _todosList.length; i++) {
      if (_todosList[i].todoId == todoId) {
        _todosList[i].isDone = !_todosList[i].isDone;
        notifyListeners();
        break;
      }
    }
  }
}
