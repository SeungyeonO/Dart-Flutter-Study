import 'package:flutter/material.dart';
import '/data/models/todo.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final VoidCallback onEdit;
  final VoidCallback onComplete;
  const TodoItem({
    super.key,
    required this.todo,
    required this.onEdit,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 217, 220, 223),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(todo.content),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(onPressed: onEdit, child: const Text('수정')),
              TextButton(onPressed: onComplete, child: const Text('완료')),
            ],
          )
        ],
      ),
    );
  }
}
