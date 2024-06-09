import 'package:flutter/material.dart';

class TodoListTile extends StatelessWidget {
  final String title;
  final String id;
  final VoidCallback onDelete;

  const TodoListTile({super.key, required this.title, required this.id, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: IconButton(
        key: const Key("deleteButton"),
        icon: const Icon(Icons.delete_forever_outlined),
        onPressed: onDelete,
      ),
    );
  }
}
