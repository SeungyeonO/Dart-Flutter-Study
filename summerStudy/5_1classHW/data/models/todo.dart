class Todo {
  final String id;
  final String content;
  final DateTime createdAt;
  final DateTime updatedAt;

  Todo(
      {required this.id,
      required this.content,
      required this.createdAt,
      required this.updatedAt});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      content: json['content'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
