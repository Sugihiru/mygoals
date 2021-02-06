import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mygoals/models/TodoModel.dart';

final todoListProvider = StateNotifierProvider<TodoListModel>((ref) {
  return TodoListModel([
    TodoModel(
        title: "Task1 doing", description: "Hello", status: TodoStatus.DOING),
    TodoModel(
        title: "Task2 compl",
        description: "Hello2",
        status: TodoStatus.COMPLETED),
    TodoModel(
        title: "Task3 doing", description: "Hello3", status: TodoStatus.DOING),
    TodoModel(title: "Task4 nothing", description: "Hello4"),
  ]);
});

final filteredTodoListProvider =
    Provider.family<List<TodoModel>, TodoStatus>((ref, status) {
  final todos = ref.watch(todoListProvider.state);
  return todos.where((todo) => todo.status == status).toList();
});
