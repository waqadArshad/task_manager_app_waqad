import '../../entities/todo_entity.dart';
import '../../repositories/todo_repository.dart';

/// handles the user input/presentation layer's regarding adding a todo
class AddTodoUseCase {
  final TodoRepository repository;

  AddTodoUseCase(this.repository);

  Future<void> call(TodoEntity todo){
    return repository.addTodo(todo);
  }

}