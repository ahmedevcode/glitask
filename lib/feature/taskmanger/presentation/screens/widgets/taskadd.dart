import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glitask/feature/taskmanger/data/model/task_model.dart';
import 'package:glitask/feature/taskmanger/controller/task_cubit.dart';
import 'package:glitask/feature/taskmanger/presentation/screens/widgets/custompaint_addtask.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();
  late AnimationController _animationController;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _slideAnimation =
        Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0))
            .animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const CustompaintAddtask(),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildTextField(_titleController, 'Title'),
                  const SizedBox(height: 10),
                  _buildTextField(_descriptionController, 'Description'),
                  const SizedBox(height: 20),
                  _buildAddTaskButton(context),
                  const SizedBox(height: 20),
                  SlideTransition(
                    position: _slideAnimation,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField _buildTextField(
      TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a $label';
        }
        return null;
      },
    );
  }

  ElevatedButton _buildAddTaskButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          final task = TaskMangment(
            id: '',
            title: _titleController.text,
            description: _descriptionController.text,
            isCompleted: false,
          );
          context.read<TaskCubit>().addTask(task);
          _titleController.clear();
          _descriptionController.clear();
          _animationController.forward().then((_) {
            _animationController.reset();
          });
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white.withOpacity(0.2),
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      child: const Text(
        'Add Task',
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
