import 'package:bloc/bloc.dart';
import 'package:todo_app/bloc/todo_events.dart';
import 'package:todo_app/bloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvents, TodoStates> {
  final List<String> todoList = [];
  TodoBloc() : super(const TodoStates()) {
    on<AddTodoEvent>(_addTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
    on<RemoveAllTodoEvent>(_removeAllTodoEvent);
    on<UpdateTodoEvent>(_updateTodoEvent);
  }

  void _addTodoEvent(AddTodoEvent events, Emitter<TodoStates> emit) {
    todoList.add(events.task);
    emit(state.copyWith(todolist: List.from(todoList)));
  }

  void _removeTodoEvent(RemoveTodoEvent events, Emitter<TodoStates> emit) {
    todoList.remove(events.task);
    emit(state.copyWith(todolist: List.from(todoList)));
  }

  void _removeAllTodoEvent(
      RemoveAllTodoEvent events, Emitter<TodoStates> emit) {
    todoList.clear();
    emit(state.copyWith(todolist: List.from(todoList)));
  }

  void _updateTodoEvent(UpdateTodoEvent events, Emitter<TodoStates> emit) {
    todoList[events.index] = events.updatedTask;
    emit(state.copyWith(todolist: List.from(todoList)));
  }
}
