import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glitask/feature/taskmanger/controller/task_cubit.dart';
import 'package:glitask/feature/taskmanger/data/model/task_model.dart';
import 'package:glitask/feature/taskmanger/data/repository/task_repository.dart';
import 'package:glitask/feature/taskmanger/presentation/screens/widgets/custompaint_taskList.dart';
import 'package:glitask/feature/taskmanger/presentation/screens/widgets/profile.dart';
import 'package:glitask/feature/taskmanger/presentation/screens/widgets/taskadd.dart';
import 'package:glitask/feature/taskmanger/presentation/screens/widgets/taskdialog.dart';

class TaskManagementScreen extends StatelessWidget {
  const TaskManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(TaskRepository())..loadTasks(),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Task Management',
              style: TextStyle(color: Colors.cyan),
            ),
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Tasks'),
                Tab(text: 'Add Task'),
                Tab(text: 'Profile'),
              ],
            ),
          ),
          body: const Stack(
            children: [
              TopBartask(),
              TabBarView(
                children: [
                  TaskList(),
                  AddTask(),
                  Profile(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskCubit, TaskState>(
      builder: (context, state) {
        if (state is TaskLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.amber,
          ));
        } else if (state is TaskLoaded) {
          final tasks = state.tasks;
          return ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return Dismissible(
                key: ValueKey(task.id),
                background: Container(color: Colors.red),
                onDismissed: (direction) {
                  context.read<TaskCubit>().deleteTask(task.id);
                },
                child: TaskItem(task: task),
              );
            },
          );
        } else if (state is TaskError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(child: Text('No tasks yet'));
        }
      },
    );
  }
}

class TaskItem extends StatelessWidget {
  final TaskMangment task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          task.title,
          style: const TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          task.description,
          style: const TextStyle(color: Colors.white70),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.white),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext dialogContext) {
                    return BlocProvider.value(
                      value: BlocProvider.of<TaskCubit>(context),
                      child: TaskDialog(task: task),
                    );
                  },
                ).then((_) {
                  context.read<TaskCubit>().loadTasks();
                });
              },
            ),
            Checkbox(
              value: task.isCompleted,
              onChanged: (bool? value) {
                context.read<TaskCubit>().updateTask(
                      TaskMangment(
                        id: task.id,
                        title: task.title,
                        description: task.description,
                        isCompleted: value ?? false,
                      ),
                    );
              },
              checkColor: Colors.white,
              activeColor: const Color(0xFFf7418c),
            ),
          ],
        ),
      ),
    );
  }
}
