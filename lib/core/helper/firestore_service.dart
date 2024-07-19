import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../feature/taskmanger/data/model/task_model.dart';

class FirestoreService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<TaskMangment>> getTasks() {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      return _db
          .collection('tasks')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((snapshot) => snapshot.docs
              .map((doc) => TaskMangment.fromMap(doc.data(), doc.id))
              .toList());
    }
    return Stream.value([]);
  }

  Future<void> addTask(TaskMangment task) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      await _db.collection('tasks').add({
        'title': task.title,
        'description': task.description,
        'isCompleted': task.isCompleted,
        'userId': userId,
      });
    }
  }

  Future<void> updateTask(TaskMangment task) async {
    await _db.collection('tasks').doc(task.id).update(task.toMap());
  }

  Future<void> deleteTask(String taskId) async {
    await _db.collection('tasks').doc(taskId).delete();
  }
}
