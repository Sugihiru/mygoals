import 'package:flutter/material.dart';
import 'package:mygoals/models/TodoModel.dart';
import 'package:mygoals/widgets/todolist_widget.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final Map<String, TodoStatus> statusMap = {
    "Doing": TodoStatus.DOING,
    "Planned": TodoStatus.PLANNED,
    "On Hold": TodoStatus.ONHOLD,
    "Completed": TodoStatus.COMPLETED,
  };
  final List<TodoStatus> initiallyExpandedStatus = [TodoStatus.DOING];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(children: buildStatusRows()));
  }

  List<Widget> buildStatusRows() {
    List<Widget> statusRows = [];
    statusMap.forEach((title, status) {
      statusRows.add(ExpansionTile(
          title: Text(title),
          children: [TodolistWidget(status)],
          initiallyExpanded: initiallyExpandedStatus.contains(status)));
    });
    return statusRows;
  }
}

/*
class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        // body: TodolistWidget(TodoStatus.COMPLETED),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ExpansionPanelList(children: [
              ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return Text("Todo");
                  },
                  body: TodolistWidget(TodoStatus.COMPLETED),
                  isExpanded: true)
            ]);
          },
        ));
  }
}
*/