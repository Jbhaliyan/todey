import 'package:flutter/material.dart';

class TodoFormWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final ValueChanged<String>? onChangedTitle;
  final ValueChanged<String>? onChangedDescription;
  final VoidCallback? onSavedTodo;

  const TodoFormWidget({
    this.title = '',
    this.description = '',
    @required this.onChangedTitle,
    @required this.onChangedDescription,
    this.onSavedTodo,
  });

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          buildTitle(),
          SizedBox(height: 15),
          buildDescription(),
          SizedBox(height: 15),
          buildButton(),
        ]),
      );

  Widget buildTitle() => TextFormField(
        initialValue: title,
        maxLines: 1,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title!.isEmpty) {
            return 'The Title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Title',
        ),
      );

  Widget buildDescription() => TextFormField(
        initialValue: description,
        maxLines: 3,
        onChanged: onChangedDescription,
        // validator: (description) {
        //   if (description!.isEmpty) {
        //     return 'The Title cannot be empty';
        //   }
        //   return null;
        // },
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: 'Description',
        ),
      );

  Widget buildButton() => Align(
        alignment: Alignment.bottomRight,
        child: ElevatedButton(
          onPressed: onSavedTodo,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Save'),
          ),
        ),
      );
}
