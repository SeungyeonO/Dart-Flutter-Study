import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test_drive/data/models/todo_repository.dart';
import 'data/models/todo.dart';
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
        '/todo-list': (context) => const TodoListPage(),
        '/create-todo': (context) => const CreateTodoPage(),
        '/edit-todo': (context) => const EditTodoPage(),
      },
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final TodoRepository repository = TodoRepository();
  List<Todo>? data;

  @override
  void initState() {
    super.initState();
    fetchTodoList();
  }

  Future<void> fetchTodoList() async {
    print('Fetching todo list');
    final List<Todo> result = await repository.list();
    setState(() {
      data = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: data != null
            ? ListView.builder(
                itemBuilder: (context, index) => TodoItem(
                  todo: data![index],
                  onEdit: () async {
                    await Navigator.pushNamed(context, '/edit-todo',
                        arguments: data![index]);
                    fetchTodoList();
                  },
                  onComplete: () async {
                    await repository.delete(data![index].id);
                    fetchTodoList();
                  },
                ),
                itemCount: data!.length,
              )
            : const CircularProgressIndicator(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/create-todo');
          fetchTodoList();
        },
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CreateTodoPage extends StatefulWidget {
  const CreateTodoPage({super.key});

  @override
  State<CreateTodoPage> createState() => _CreateTodoPageState();
}

class _CreateTodoPageState extends State<CreateTodoPage> {
  final TextEditingController newTodo = TextEditingController();
  final TodoRepository repository = TodoRepository();

  bool isLoading = false;

  Future<void> createTodo() async {
    setState(() {
      isLoading = true;
    });

    final content = newTodo.text;
    await repository.create(content);
  }

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
                onPressed: () async {
                  if (isLoading) {
                    return;
                  }

                  await createTodo();

                  Navigator.pop(context);
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
    final prevTodo = ModalRoute.of(context)!.settings.arguments as Todo;
    return EditTodoWidget(prevTodo: prevTodo);
  }
}

class EditTodoWidget extends StatefulWidget {
  final Todo prevTodo;

  const EditTodoWidget({super.key, required this.prevTodo});

  @override
  State<EditTodoWidget> createState() => _EditTodoWidgetState();
}

class _EditTodoWidgetState extends State<EditTodoWidget> {
  final TodoRepository repository = TodoRepository();
  final TextEditingController editedTodo = TextEditingController();
  late Todo prevTodo;

  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    prevTodo = widget.prevTodo;
    editedTodo.text = prevTodo.content;
  }

  Future<void> editTodo() async {
    setState(() {
      isLoading = true;
    });

    final content = editedTodo.text;
    final todoId = prevTodo.id;
    await repository.update(todoId, content);
  }

  @override
  Widget build(BuildContext context) {
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
                onPressed: () async {
                  if (isLoading) {
                    return;
                  }

                  await editTodo();

                  Navigator.pop(context);
                },
                child: const Text('수정 완료')),
          ],
        ),
      ),
    );
  }
}

//json serializable
