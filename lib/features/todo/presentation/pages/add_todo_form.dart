import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/features/todo/domain/entities/todo_entity.dart';
import 'package:uuid/uuid.dart';

import '../provider/todo_provider.dart';

/// the form used for validating todo title and sending an add request to provider
class AddTodoForm extends ConsumerWidget {
  AddTodoForm({super.key});

  static final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleCon = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: TextFormField(
              key: const Key("addField"),
              controller: _titleCon,
              validator: (val) {
                String value = val ?? "";
                if (value.isEmpty) {
                  return "Title cannot be empty";
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            key: const Key("addButton"),
            onPressed: () {
              // validate the field and add the todo
              if (_formKey.currentState!.validate()) {
                final newTodo = TodoEntity(
                  id: const Uuid().v1(),
                  title: _titleCon.text,
                );

                ref.read(todoListNotifierProvider.notifier).addNewTodo(newTodo);
                _titleCon.clear();

                // close the keyboard
                FocusScope.of(context).unfocus();
              }
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width - 20,
              child: const Center(
                child: Text("Add Todo"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
