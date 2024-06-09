import '../../domain/entities/todo_entity.dart';
import '../../domain/repositories/todo_repository.dart';
import '../data_sources/todo_datasource.dart';
import '../models/todo_model.dart';

/// repository handling actual implementation of our TodoRepository interface
class TodoRepositoryImpl implements TodoRepository {
  final TodoLocalDataSource localDataSource;

  TodoRepositoryImpl(this.localDataSource);


  @override
  Future<void> addTodo(TodoEntity todoEntity) async {
    final TodoModel todo = TodoModel.fromEntity(todoEntity);
    localDataSource.addTodo(todo);
  }

  @override
  Future<void> deleteTodo(String id) async {
    localDataSource.deleteTodo(id);
  }

  @override
  List<TodoEntity> getTodos() {
    final List<TodoModel> todos = localDataSource.getTodos();
    List<TodoEntity> res = todos.map((model) => model.toEntity()).toList();
    return res;
  }
}
