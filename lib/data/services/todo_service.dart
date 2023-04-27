import 'package:flutter_ssot_sample/data/model/todo.dart';

List<Todo> todos = [
  const Todo(
    id: 0,
    title: 'Flutterの勉強',
    description: 'Flutterの勉強をする',
  ),
  const Todo(
    id: 1,
    title: 'Flutterの勉強',
    description: 'Flutterの勉強をする',
  ),
];

class TodoService {
  // 取得する
  Future<List<Todo>> getTodos() async {
    return todos;
  }

  // 追加する
  Future<void> addTodo(Todo todo) async {
    todos.add(todo.copyWith(id: todos.length));
  }

  // 更新する
  Future<void> update(Todo todo) async {
    todos = todos.map((e) {
      if (e.id == todo.id) {
        return todo;
      }
      return e;
    }).toList();
  }
}
