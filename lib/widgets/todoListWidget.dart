import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todey/model/todo.dart';
import 'package:todey/provider/todosProvider.dart';

import 'todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  // const TodoListWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);

    final todos = provider.todos;
    return todos.isEmpty
        ? Center(
            child: Text(
              'No Todos.',
              style: TextStyle(fontSize: 20),
            ),
          )
        : ListView.separated(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(16),
            itemBuilder: (context, index) {
              final todo = todos[index];
              return TodoWidget(todo: todo);
            },
            separatorBuilder: (context, index) => Container(
                  height: 10,
                ),
            itemCount: todos.length);
  }
}
