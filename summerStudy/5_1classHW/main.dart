import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'widgets/TodoItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/todo-list',
      routes: {
        '/todo-list': (context) => TodoListPage(),
        '/create-todo': (context) => CreateTodoPage(),
        '/edit-todo': (context) => const EditTodoPage(),
      },
    );
  }
}

class TodoListPage extends StatelessWidget {
  final List<String> data = [
    'Todo Item 1',
    'Todo Item 2',
    'Todo Item 3',
    'Todo Item 4',
    'Todo Item 5',
    'Todo Item 6',
    'Todo Item 7',
    'Todo Item 8',
    'Todo Item 9',
    'Todo Item 10',
  ];

  TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) => TodoItem(content: data[index]),
          itemCount: data.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/create-todo');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CreateTodoPage extends StatelessWidget {
  final TextEditingController newTodo = TextEditingController();

  CreateTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('생성하기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 217, 220, 223),
              height: 100,
              width: 400,
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: newTodo,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                  hintText: '할 일을 입력해주세요',
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, newTodo.text);
                },
                child: const Text('생성하기')),
          ],
        ),
      ),
    );
  }
}

class EditTodoPage extends StatelessWidget {
  const EditTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;
    final TextEditingController editedTodo =
        TextEditingController(text: '$data');

    return Scaffold(
      appBar: AppBar(
        title: const Text('수정하기'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 217, 220, 223),
              height: 100,
              width: 400,
              padding: const EdgeInsets.all(15),
              child: TextField(
                controller: editedTodo,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(10),
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pop(context, editedTodo.text);
                },
                child: const Text('수정 완료')),
          ],
        ),
      ),
    );
  }
}
