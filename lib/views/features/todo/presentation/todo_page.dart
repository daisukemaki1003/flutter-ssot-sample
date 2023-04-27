import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ssot_sample/data/model/todo.dart';
import 'package:flutter_ssot_sample/views/features/todo/controller/todos_controller.dart';

class TodoPage extends ConsumerWidget {
  TodoPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODOアプリ'),
      ),
      body: ref.watch(todosProvider).when(
            error: (err, stack) => Text('Error2 $err'),
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (todos) {
              return ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  final todo = todos[index];
                  return ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.description),
                    trailing: Checkbox(
                      value: todo.isCompleted,
                      onChanged: (value) {
                        if (value == null) return;
                        ref
                            .read(todosControllerProvider)
                            .updateTodo(todo.copyWith(isCompleted: value));
                      },
                    ),
                  );
                },
              );
            },
          ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      TextFormField(
                        controller: _titleController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'タイトルは必須です';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: 'タイトル',
                        ),
                      ),
                      TextFormField(
                        controller: _descriptionController,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return '説明は必須です';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          labelText: '説明',
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final todo = Todo(
                              title: _titleController.text,
                              description: _descriptionController.text,
                            );
                            ref.read(todosControllerProvider).addTodo(todo);
                            Navigator.of(context).pop();
                            _titleController.clear();
                            _descriptionController.clear();
                          }
                        },
                        child: const Text('追加'),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
