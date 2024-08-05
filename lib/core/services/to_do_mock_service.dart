import 'dart:async';

import 'package:to_do_app/core/services/to_do_service.dart';
import 'package:to_do_app/core/models/to_do.dart';

class ToDoMockService implements ToDoService {
  static final List<ToDo> _toDos = [];
  static MultiStreamController<List<ToDo>>? _controller;

  static final _toDoStream = Stream<List<ToDo>>.multi((controller) {
    _controller = controller;
    controller.add(_toDos);
  });

  Stream<List<ToDo>> toDoStream() {
    return _toDoStream;
  }

  Future<void> remove(ToDo toDo) async {
    _toDos.remove(toDo);
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

    _controller?.add(_toDos);
    return newToDo;
  }
}
