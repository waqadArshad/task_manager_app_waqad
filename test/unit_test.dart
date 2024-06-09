import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_manager_app/features/todo/domain/entities/todo_entity.dart';
import 'package:task_manager_app/features/todo/presentation/provider/todo_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Provider test', () {
    final container = createContainer();

    expect(
      container.read(todoListNotifierProvider),
      equals([]),
    );
  });

  test('Provider add test', () {
    final container = createContainer();

    expect(
      container.read(todoListNotifierProvider),
      equals([]),
    );

    container.read(todoListNotifierProvider.notifier).addNewTodo(const TodoEntity(id: "id", title: "title"));

    expect(
      container.read(todoListNotifierProvider),
      equals([const TodoEntity(id: "id", title: "title")]),
    );
  });

  test('Provider delete test', () {
    final container = createContainer();

    expect(
      container.read(todoListNotifierProvider),
      equals([]),
    );

    container.read(todoListNotifierProvider.notifier).addNewTodo(const TodoEntity(id: "id", title: "title"));
    container.read(todoListNotifierProvider.notifier).deleteTodo("id");

    expect(
      container.read(todoListNotifierProvider).length,
      equals(0),
    );
  });
}

/// A testing utility which creates a [ProviderContainer] and automatically
/// disposes it at the end of the test.
ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  // Create a ProviderContainer, and optionally allow specifying parameters.
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  // When the test ends, dispose the container.
  addTearDown(container.dispose);

  return container;
}
