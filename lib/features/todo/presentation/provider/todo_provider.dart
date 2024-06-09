import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/features/todo/domain/entities/todo_entity.dart';
import 'package:task_manager_app/features/todo/domain/use_cases/add_todo/add_todo.dart';
import 'package:task_manager_app/features/todo/domain/use_cases/delete_todo/delete_todo.dart';
import 'package:task_manager_app/features/todo/domain/use_cases/get_todo/get_todo.dart';

import '../../data/data_sources/todo_datasource.dart';
import '../../data/repositories/todo_repository_impl.dart';
import '../../domain/repositories/todo_repository.dart';

/// handles the local database initialization
final todoLocalDataSourceProvider = Provider<TodoLocalDataSource>((ref) {
  return TodoLocalDataSource({});
});

/// repository handling provider
final todoRepositoryProvider = Provider<TodoRepository>((ref) {
  final localDataSource = ref.read(todoLocalDataSourceProvider);
  return TodoRepositoryImpl(localDataSource);
});

/// get todos use case provider
final getTodosProvider = Provider<GetTodoUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return GetTodoUseCase(repository);
});

/// add todos use case provider
final addTodoProvider = Provider<AddTodoUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return AddTodoUseCase(repository);
});

/// delete todos use case provider
final deleteTodoProvider = Provider<DeleteTodoUseCase>((ref) {
  final repository = ref.read(todoRepositoryProvider);
  return DeleteTodoUseCase(repository);
});

/// This provider will manage fetching todos from the repository
final todoListNotifierProvider = StateNotifierProvider<TodoListNotifier, List<TodoEntity>>((ref) {
  final getTodos = ref.read(getTodosProvider);
  final addTodo = ref.read(addTodoProvider);
  final deleteTodo = ref.read(deleteTodoProvider);

  return TodoListNotifier(getTodos, addTodo, deleteTodo);
});


/// main notifier class which handles the user input
class TodoListNotifier extends StateNotifier<List<TodoEntity>> {
  final GetTodoUseCase _getTodos;
  final AddTodoUseCase _addTodo;
  final DeleteTodoUseCase _deleteTodo;

  TodoListNotifier(this._getTodos, this._addTodo, this._deleteTodo) : super([]);

  /// Load todos from the repository and updates the state.
  void loadTodos() {
    final todos = _getTodos();
    state = todos;
  }

  /// adds a new todo and updates the state
  void addNewTodo(TodoEntity todo) {
    _addTodo(todo);
    loadTodos(); //+ to update the state

    /* + updating state by calling loadTodos instead + */
    // state = [...state, todo];
  }

  /// deletes a todo and updates the state
  void deleteTodo(String todoId) {
    _deleteTodo(todoId);
    loadTodos(); //+ to update the state

    /* + updating state by calling loadTodos instead + */
    // state.removeWhere((element) => element.id == todoId);
    // state = [...state];
  }
}
