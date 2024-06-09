import 'package:equatable/equatable.dart';

/// our app's data entity
class TodoEntity extends Equatable {
  final String id;
  final String title;

  const TodoEntity({
    required this.id,
    required this.title,
  });

  @override
  List<Object?> get props => [id, title];
}