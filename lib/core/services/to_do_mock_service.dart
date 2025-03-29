import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_app/core/services/to_do_service.dart';
import 'package:to_do_app/core/models/to_do.dart';

class ToDoMockService implements ToDoService {
  static final List<ToDo> _toDos = [];
  static MultiStreamController<List<ToDo>>? _controller;
  static bool _initialized = false; // Flag to check if the data is loaded

  static final _toDoStream = Stream<List<ToDo>>.multi((controller) {
    _controller = controller;
    if (!_initialized) {
      _loadToDos().then((_) {
        controller.add(_toDos);
        _initialized = true; // Mark as initialized after loading
      });
    }
  });

  static Future<void> _loadToDos() async {
    final prefs = await SharedPreferences.getInstance();
    final toDosJson = prefs.getString('toDos');
    if (toDosJson != null) {
      final List<dynamic> decoded = jsonDecode(toDosJson);
      _toDos.clear();
      _toDos.addAll(decoded.map((e) => ToDo.fromJson(e)));
    }
  }

  static Future<void> _saveToDos() async {
    final prefs = await SharedPreferences.getInstance();
    final toDosJson = jsonEncode(_toDos.map((e) => e.toJson()).toList());
    await prefs.setString('toDos', toDosJson);
  }

  Stream<List<ToDo>> toDoStream() {
    return _toDoStream;
  }

  Future<void> remove(ToDo toDo) async {
    _toDos.remove(toDo);
    await _saveToDos();
    _controller?.add(_toDos);
  }

  Future<void> conclued(ToDo toDo) async {
    toDo.toggleIsConclued();
    await _saveToDos();
    _controller?.add(_toDos);
  }

  Future<ToDo> save(
    String title,
    String description,
    DateTime? date,
  ) async {
    final newToDo = ToDo(
      title: title,
      description: description,
      date: date,
    );

    _toDos.add(newToDo);
    await _saveToDos();
    _controller?.add(_toDos);
    return newToDo;
  }
}
