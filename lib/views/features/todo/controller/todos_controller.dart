import 'package:flutter_ssot_sample/data/model/todo.dart';
import 'package:flutter_ssot_sample/data/services/todo_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todos_controller.g.dart';

/// Todoリストを取得する際は、todosProviderを呼び出す
/// AutoDisposeで、画面が破棄された際に、todosProviderも破棄される
/// Todoリストを操作した際は明示的にinvalidateを呼び出す
@riverpod
Future<List<Todo>> todos(TodosRef ref) async {
  return TodoService().getTodos();
}

@riverpod
TodosController todosController(TodosControllerRef ref) => TodosController();

/// ViewからServiceを呼び出すためのController
class TodosController {
  void addTodo(Todo todo) async {
    TodoService().addTodo(todo);
  }

  void updateTodo(Todo todo) async {
    TodoService().update(todo);
  }
}
