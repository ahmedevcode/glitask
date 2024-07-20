import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glitask/feature/taskmanger/controller/task_cubit.dart';
import 'package:glitask/feature/taskmanger/data/model/task_model.dart';

class TaskDialog extends StatefulWidget {
  final TaskMangment task;

  const TaskDialog({Key? key, required this.task}) : super(key: key);

  @override
  _TaskDialogState createState() => _TaskDialogState();
}

class _TaskDialogState extends State<TaskDialog> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.task.title);
    _descriptionController =
        TextEditingController(text: widget.task.description);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: const Text(
        'Edit Task',
        style: TextStyle(color: Colors.cyan, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
              labelStyle: TextStyle(color: Colors.cyan),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
            ),
          ),
          TextField(
            controller: _descriptionController,
            decoration: const InputDecoration(
              labelText: 'Description',
              labelStyle: TextStyle(color: Colors.cyan),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.cyan),
              ),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.redAccent),
          ),
        ),
        TextButton(
          onPressed: () {
            final updatedTask = TaskMangment(
              id: widget.task.id,
              title: _titleController.text,
              description: _descriptionController.text,
              isCompleted: widget.task.isCompleted,
            );
            context.read<TaskCubit>().updateTask(updatedTask);
            Navigator.of(context).pop();
          },
          child: const Text(
            'Save',
            style: TextStyle(color: Colors.cyan),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
