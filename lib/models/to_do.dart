import 'dart:math';

class ToDo {
  String id;
  String title;
  String description;
  DateTime? date;

  ToDo({
    String? id,
    required this.title,
    required this.description,
  }) : id = id ?? Random().nextDouble().toString();
}
