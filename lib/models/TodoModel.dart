import 'package:flutter_riverpod/flutter_riverpod.dart';

enum TodoStatus { COMPLETED, DOING, PLANNED, ONHOLD }

class TodoModel {
  TodoModel({this.title, this.description, this.status});

  final String title;
  final String description;
  final TodoStatus status;
}

class TodoListModel extends StateNotifier<List<TodoModel>> {
  TodoListModel([List<TodoModel> initialTodos]) : super(initialTodos ?? []);

  void add(String title, String description) {
    state = [
      ...state,
      TodoModel(
          title: title, description: description, status: TodoStatus.PLANNED),
    ];
  }
}
