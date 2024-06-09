import '../../entities/todo_entity.dart';
import '../../repositories/todo_repository.dart';

/// handles the user input/presentation layer's regarding deleting a todo
class DeleteTodoUseCase {
  final TodoRepository repository;

  DeleteTodoUseCase(this.repository);

  Future<void> call(String id){
    return repository.deleteTodo(id);
  }
}