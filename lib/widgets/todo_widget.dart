import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todey/model/todo.dart';
import 'package:todey/pages/edit_todo_page.dart';
import 'package:todey/provider/todosProvider.dart';

import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo? todo;
  const TodoWidget({required this.todo});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Slidable(
          actionPane: SlidableDrawerActionPane(),
          key: Key(todo!.id),
          actions: [
            IconSlideAction(
              color: Colors.green,
              caption: 'Edit',
              icon: Icons.edit,
              onTap: () {
                editTodo(context, todo);
              },
            )
          ],
          secondaryActions: [
            IconSlideAction(
              color: Colors.red,
              caption: 'Delete',
              icon: Icons.delete,
              onTap: () {
                deleteTodo(context, todo);
              },
            )
          ],
          child: buildTodo(context),
        ),
      );

  Widget buildTodo(BuildContext context) {
    return GestureDetector(
      onTap: () => editTodo(context, todo),
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Checkbox(
              value: todo!.isDone,
              onChanged: (_) {
                final provider =
                    Provider.of<TodosProvider>(context, listen: false);
                final isDone = provider.toggleTodoStatus(todo!);
                Utils.showSnackBar(context,
                    isDone ? 'Task Completed' : 'Task marked incomplete');
              },
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.orange,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo!.title!,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                    ),
                  ),
                  if (todo!.description.isNotEmpty)
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      child: Text(
                        todo!.description,
                        style: TextStyle(
                          fontSize: 20,
                          height: 1.5,
                        ),
                      ),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void deleteTodo(BuildContext context, Todo? todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);

    Utils.showSnackBar(context, 'Deleted the task');
  }

  void editTodo(BuildContext context, Todo? todo) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditTodoPage(todo: todo),
      ),
    );
  }
}
