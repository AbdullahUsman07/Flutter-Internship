
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:day_11/models/task_model.dart';
import 'package:firebase_auth/firebase_auth.dart'; // your Task model

class TaskService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;


  CollectionReference<Map<String, dynamic>> _taskCollection() {
    final user = _auth.currentUser;
    if (user == null) throw Exception("No logged-in user");
    return _firestore.collection('users').doc(user.uid).collection('tasks');
  }

  // Create Task
  Future<void> addTask(Task task) async {
    final docRef = await _taskCollection().add(task.toJson());
    // automated id assigned
    await docRef.update({'id': docRef.id});
  }

  //  Get all tasks 
  Stream<List<Task>> getTasks() {
    return _taskCollection().snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return Task.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }

  // Update Task
  Future<void> updateTask(Task task) async {
    if (task.id == null) throw Exception("Task ID is missing");
    await _taskCollection().doc(task.id).update(task.toJson());
  }

  //  Delete Task
  Future<void> deleteTask(String taskId) async {
    await _taskCollection().doc(taskId).delete();
  }
}
