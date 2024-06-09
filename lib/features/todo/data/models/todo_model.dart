import 'package:equatable/equatable.dart';

import '../../domain/entities/todo_entity.dart';

/// remote or local data's model which is then translated to our app's data entity
class TodoModel extends Equatable {
  final String id;
  final String title;

  const TodoModel({
    required this.id,
    required this.title,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json["id"] ?? "",
      title: json["title"] ?? "",
    );
  }

  factory TodoModel.fromEntity(TodoEntity todoEntity) {
    return TodoModel(
      id: todoEntity.id,
      title: todoEntity.title,
    );
  }

  TodoEntity toEntity() => TodoEntity(id: id, title: title);

  Map<String, dynamic> toJson() => {"id": id, "title": title};

  @override
  List<Object?> get props => [id, title];
}
