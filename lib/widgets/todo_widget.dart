import 'package:flutter/material.dart';
import 'package:mygoals/models/TodoModel.dart';

class TodoWidget extends StatelessWidget {
  const TodoWidget(this.todo, {Key key}) : super(key: key);
  final TodoModel todo;

  @override
  Widget build(BuildContext context) {
    return ListTile(title: Text(todo.title));
  }
}
