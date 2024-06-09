import 'package:flutter/material.dart';
import 'package:task_manager_app/features/todo/presentation/pages/todos_list_view.dart';

import 'add_todo_form.dart';

/// the homa page combining all the widgets
class TodosHome extends StatelessWidget {
  const TodosHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo List"),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.height,
          child: Column(
            children: <Widget>[
              AddTodoForm(),
              const Divider(
                height: 10,
                thickness: 10,
              ),
              const Expanded(
                child: TodosListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
