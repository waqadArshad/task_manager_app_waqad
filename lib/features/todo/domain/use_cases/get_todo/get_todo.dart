import '../../entities/todo_entity.dart';
import '../../repositories/todo_repository.dart';

/// handles the user input/presentation layer's request regarding getting the todos
class GetTodoUseCase {
  final TodoRepository repository;

  GetTodoUseCase(this.repository);

  List<TodoEntity> call(){
    return repository.getTodos();
  }
}