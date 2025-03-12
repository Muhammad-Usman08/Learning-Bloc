import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/bloc/todo_events.dart';
import 'package:todo_app/bloc/todo_state.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: const Text(
          'Todo App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocBuilder<TodoBloc, TodoStates>(builder: (context, state) {
        if (state.todoList.isEmpty) {
          return const Center(child: Text('No Todos Found!'));
        } else if (state.todoList.isNotEmpty) {
          return Column(
            children: [
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    context.read<TodoBloc>().add(RemoveAllTodoEvent());
                  },
                  child: const Text('Delete All')),
              const SizedBox(height: 30),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.todoList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.todoList[index]),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                _showUpdateDialog(context, index);
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                context.read<TodoBloc>().add(RemoveTodoEvent(
                                    task: state.todoList[index]));
                              },
                              icon: const Icon(Icons.delete)),
                        ],
                      ),
                    );
                  }),
            ],
          );
        } else {
          return const SizedBox();
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showAddTaskDialog(BuildContext context) {
    TextEditingController taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Task'),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(hintText: 'Enter task name'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  context
                      .read<TodoBloc>()
                      .add(AddTodoEvent(task: taskController.text));
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void _showUpdateDialog(BuildContext context, int index) {
    TextEditingController taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Update Task'),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(hintText: 'Enter update task'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  context
                      .read<TodoBloc>()
                      .add(UpdateTodoEvent(index: index, updatedTask: taskController.text));
                  Navigator.pop(context);
                }
              },
              child: const Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
