import 'package:to_do_app/core/models/to_do.dart';
import 'package:to_do_app/core/services/to_do_mock_service.dart';

abstract class ToDoService {
  Stream<List<ToDo>> toDoStream();

  Future<void> remove(ToDo toDo);

  Future<void> conclued(ToDo toDo);

  Future<ToDo> save(
    String title,
    String description,
    DateTime? date,
  );

  factory ToDoService() {
    return ToDoMockService();
  }
}
