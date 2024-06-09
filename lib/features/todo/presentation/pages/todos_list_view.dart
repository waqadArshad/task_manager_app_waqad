import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/features/todo/domain/entities/todo_entity.dart';
import 'package:task_manager_app/features/todo/presentation/widgets/todo_list_tile.dart';

import '../provider/todo_provider.dart';

/// actual list view showing the todos
class TodosListView extends ConsumerWidget {
  const TodosListView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoList = ref.watch(todoListNotifierProvider);

    return ListView.builder(
      itemCount: todoList.length,
      padding: const EdgeInsets.all(10),
      itemBuilder: (BuildContext context, int index) {
        final TodoEntity todo = todoList[index];
        return TodoListTile(
          title: todo.title,
          id: todo.id,
          onDelete: () {
            ref.read(todoListNotifierProvider.notifier).deleteTodo(todo.id);
          },
        );
      },
    );
  }
}
