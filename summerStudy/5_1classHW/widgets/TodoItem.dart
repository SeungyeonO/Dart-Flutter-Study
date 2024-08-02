import 'package:flutter/material.dart';
import '/main.dart';

class TodoItem extends StatelessWidget {
  final String content;
  const TodoItem({super.key, required this.content});

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
          Text(content),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: ((context) => const EditTodoPage()),
                        settings: RouteSettings(arguments: content),
                      ),
                    );
                    print('수정완료');
                  },
                  child: const Text('수정')),
              TextButton(onPressed: () {}, child: const Text('완료')),
            ],
          )
        ],
      ),
    );
  }
}
