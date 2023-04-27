import 'package:flutter_ssot_sample/data/model/todo.dart';
import 'package:flutter_ssot_sample/data/services/todo_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todos_controller.g.dart';

@riverpod
class TodosController extends _$TodosController {
  @override
  FutureOr<List<Todo>> build() {
    return TodoService().getTodos();
  }

  void addTodo(Todo todo) async {
    state = await AsyncValue.guard(() {
      TodoService().addTodo(todo);
      return TodoService().getTodos();
    });
  }

  void updateTodo(Todo todo) async {
    state = await AsyncValue.guard(() {
      TodoService().update(todo);
      return TodoService().getTodos();
    });
  }
}
