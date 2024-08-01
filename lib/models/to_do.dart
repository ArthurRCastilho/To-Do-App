import 'dart:math';

import 'package:flutter/material.dart';

class ToDo with ChangeNotifier {
  String id;
  String title;
  String description;
  DateTime? date;
  bool isConclued = false;

  ToDo({
    String? id,
    required this.title,
    required this.description,
    this.date,
  }) : id = id ?? Random().nextDouble().toString();
}
