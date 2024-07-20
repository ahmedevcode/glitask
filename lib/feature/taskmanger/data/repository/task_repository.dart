import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:glitask/feature/taskmanger/data/model/task_model.dart';

class TaskRepository {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<List<TaskMangment>> fetchTasks() async {
    final user = auth.currentUser;
    if (user == null) throw Exception("No user logged in");

    final querySnapshot = await firestore
        .collection('tasks')
        .where('userId', isEqualTo: user.uid)
        .get();
    return querySnapshot.docs
        .map((doc) => TaskMangment.fromMap(doc.data(), doc.id))
        .toList();
  }

  Future<void> addTask(TaskMangment task) async {
    final user = auth.currentUser;
    if (user == null) throw Exception("No user logged in");

    await firestore.collection('tasks').add({
      'userId': user.uid,
      ...task.toMap(),
    });
  }

  Future<void> updateTask(TaskMangment task) async {
    await firestore.collection('tasks').doc(task.id).update(task.toMap());
  }

  Future<void> deleteTask(String taskId) async {
    await firestore.collection('tasks').doc(taskId).delete();
  }
}
