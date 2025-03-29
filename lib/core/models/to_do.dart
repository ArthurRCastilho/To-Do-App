import 'dart:math';

import 'package:flutter/material.dart';

class ToDo with ChangeNotifier {
  String id;
  String title;
  String description;
  DateTime? date;
  bool isConclued;

  ToDo({
    String? id,
    required this.title,
    required this.description,
    this.date,
    this.isConclued = false,
  }) : id = id ?? Random().nextDouble().toString();

  bool toggleIsConclued() {
    return isConclued = !isConclued;
  }

  // Converte o objeto para JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'date': date?.toIso8601String(),
      'isConclued': isConclued,
    };
  }

  // Construtor que cria um objeto a partir de um JSON
  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      title: json['title'],
      description: json['description'],
      date: json['date'] != null ? DateTime.parse(json['date']) : null,
      isConclued: json['isConclued'] ?? false,
    );
  }
}
