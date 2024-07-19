class TaskMangment {
  String id;
  String title;
  String description;
  bool isCompleted;

  TaskMangment(
      {required this.id,
      required this.title,
      required this.description,
      this.isCompleted = false});

  factory TaskMangment.fromMap(Map<String, dynamic> data, String documentId) {
    return TaskMangment(
      id: documentId,
      title: data['title'],
      description: data['description'],
      isCompleted: data['isCompleted'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
    };
  }
}
