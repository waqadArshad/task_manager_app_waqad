import '../entities/todo_entity.dart';

abstract class TodoRepository{
  List<TodoEntity> getTodos();
  Future<void> addTodo(TodoEntity todo);
  Future<void> deleteTodo(String id);
}