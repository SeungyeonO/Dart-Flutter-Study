import 'package:dio/dio.dart';

import 'todo.dart';

class TodoRepository {
  final dio = Dio(BaseOptions(
    baseUrl: 'http://34.22.97.5:3000',
    headers: {'Authorization': 'Basic hello'},
  ));

  Future<List<Todo>> list() async {
    final response = await dio.get('/todos');
    return List.from(response.data).map((json) => Todo.fromJson(json)).toList();
  }

  Future<Todo> get(String todoId) async {
    final response = await dio.get('/todos/$todoId');
    return Todo.fromJson(response.data);
  }

  Future<Todo> create(String content) async {
    final response = await dio.post('/todos', data: {
      'content': content,
    });
    return Todo.fromJson(response.data);
  }

  Future<Todo> update(String todoId, String content) async {
    final response = await dio.put(
      '/todos/$todoId',
      data: {'content': content},
    );
    return Todo.fromJson(response.data);
  }

  Future<void> delete(String todoId) async {
    await dio.delete('/todos/$todoId');
  }
}
