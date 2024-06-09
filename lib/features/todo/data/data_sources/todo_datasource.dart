import '../models/todo_model.dart';

class TodoLocalDataSource {
  final Map<String, TodoModel> todosMap;

  TodoLocalDataSource(this.todosMap);

  List<TodoModel> getTodos() {
    return todosMap.values.toList();
  }

  void addTodo(TodoModel todo) {
    todosMap.putIfAbsent(todo.id, () => todo);
  }

  void deleteTodo(String id) {
    todosMap.remove(id);
  }
}
