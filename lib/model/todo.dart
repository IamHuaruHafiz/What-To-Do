class Todo {
  final String id;
  final String todoTitle;
  final String todoDesc;
  final String time;
  final String category;
  final String categoryColor;
  final String priorityLevel;

  Todo({
    required this.id,
    required this.todoTitle,
    required this.todoDesc,
    required this.time,
    required this.category,
    required this.categoryColor,
    required this.priorityLevel,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "todoTitle": todoTitle,
      "todoDesc": todoDesc,
      "date": time,
      "category": category,
      "categoryColor": categoryColor,
      "priorityLevel": priorityLevel,
    };
  }
}
