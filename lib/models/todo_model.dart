class TodoModel {
  final int todoId;
  String todoTitle;
  String todoContent;
  final DateTime todoCreatedDate;
  bool isDone;

  TodoModel({
    required this.todoId,
    required this.todoTitle,
    required this.todoCreatedDate,
    required this.todoContent,
    required this.isDone,
  });
}
