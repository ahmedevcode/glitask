import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glitask/feature/taskmanger/data/model/task_model.dart';
import 'package:glitask/feature/taskmanger/data/repository/task_repository.dart';

part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository taskRepository;

  TaskCubit(this.taskRepository) : super(TaskInitial());

  void loadTasks() async {
    try {
      emit(TaskLoading());
      final tasks = await taskRepository.fetchTasks();
      emit(TaskLoaded(tasks));
    } catch (e) {
      emit(const TaskError("Failed to load tasks"));
    }
  }

  void addTask(TaskMangment task) async {
    try {
      await taskRepository.addTask(task);
      loadTasks();
    } catch (e) {
      emit(const TaskError("Failed to add task"));
    }
  }

  void updateTask(TaskMangment task) async {
    try {
      await taskRepository.updateTask(task);
      loadTasks();
    } catch (e) {
      emit(const TaskError("Failed to update task"));
    }
  }

  void deleteTask(String taskId) async {
    try {
      await taskRepository.deleteTask(taskId);
      loadTasks();
    } catch (e) {
      emit(const TaskError("Failed to delete task"));
    }
  }
}
