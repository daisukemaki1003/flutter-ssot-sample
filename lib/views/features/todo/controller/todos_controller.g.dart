// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todosHash() => r'80432b86af896eb3badd4c4dff85dc73988e8bc1';

/// Todoリストを取得する際は、todosProviderを呼び出す
/// AutoDisposeで、画面が破棄された際に、todosProviderも破棄される
/// Todoリストを操作した際は明示的にinvalidateを呼び出す
///
/// Copied from [todos].
@ProviderFor(todos)
final todosProvider = AutoDisposeFutureProvider<List<Todo>>.internal(
  todos,
  name: r'todosProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$todosHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodosRef = AutoDisposeFutureProviderRef<List<Todo>>;
String _$todosControllerHash() => r'a185520b9ea27c2b48ae1efa009baeab46964875';

/// See also [todosController].
@ProviderFor(todosController)
final todosControllerProvider = AutoDisposeProvider<TodosController>.internal(
  todosController,
  name: r'todosControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$todosControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TodosControllerRef = AutoDisposeProviderRef<TodosController>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
