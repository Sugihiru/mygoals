import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mygoals/models/TodoModel.dart';
import 'package:mygoals/providers/todolist_provider.dart';
import 'package:mygoals/widgets/todo_widget.dart';

class TodolistWidget extends ConsumerWidget {
  TodolistWidget(this.status);

  final TodoStatus status;

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final List<TodoModel> todoListModel =
        watch(filteredTodoListProvider(status));

    return ListView(
      shrinkWrap: true,
      children: createTodoRows(todoListModel),
    );
  }

  List<Widget> createTodoRows(List<TodoModel> todoListModel) {
    List<Widget> todoListRows = [];
    todoListModel.forEach((x) {
      todoListRows.add(TodoWidget(x));
    });
    return todoListRows;
  }
}
