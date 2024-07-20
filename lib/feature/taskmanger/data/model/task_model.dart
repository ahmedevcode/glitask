class TaskMangment {
  final String id;
  final String title;
  final String description;
  final bool isCompleted;

  TaskMangment({
    required this.id,
    required this.title,
    required this.description,
    required this.isCompleted,
  });

  factory TaskMangment.fromMap(Map<String, dynamic> data, String documentId) {
    return TaskMangment(
      id: documentId,
      title: data['title'],
      description: data['description'],
      isCompleted: data['isCompleted'],
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
