import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable {
  const TodoEvents();
}

class AddTodoEvent extends TodoEvents {
  final String task;

  const AddTodoEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class RemoveTodoEvent extends TodoEvents {
  final Object task;

  const RemoveTodoEvent({required this.task});

  @override
  List<Object?> get props => [task];
}

class RemoveAllTodoEvent extends TodoEvents {
  @override
  List<Object?> get props => [];
}

class UpdateTodoEvent extends TodoEvents {
  int index;
  String updatedTask;
  UpdateTodoEvent({required this.index, required this.updatedTask});

  @override
  List<Object?> get props => [];
}
