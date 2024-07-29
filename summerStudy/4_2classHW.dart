import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  final TextEditingController num1Controller = TextEditingController();
  final TextEditingController num2Controller = TextEditingController();
  int? num1;
  int? num2;

  FirstPage({super.key});

  bool isValidInput() {
    num1 = int.tryParse(num1Controller.text);
    num2 = int.tryParse(num2Controller.text);

    if (num1 != null && num2 != null) {
      if (num1! > 0 && num1! < 101) {
        if (num2! > 0 && num2! < 101) return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    void add() {
      if (isValidInput()) {
        var result = num1! + num2!;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SecondPage(),
            settings: RouteSettings(arguments: result),
          ),
        );
      }
    }

    void subtract() {
      if (isValidInput()) {
        var result = num1! - num2!;

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SecondPage(),
            settings: RouteSettings(arguments: result),
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: num1Controller,
              decoration: const InputDecoration(
                labelText: 'Enter the number1',
                hintText: '1에서 100 사이의 숫자을 입력하시오',
              ),
            ),
            TextField(
              controller: num2Controller,
              decoration: const InputDecoration(
                labelText: 'Enter the number2',
                hintText: '1에서 100 사이의 숫자을 입력하시오',
              ),
            ),
            TextButton(
              onPressed: add,
              child: const Text('+', style: TextStyle(fontSize: 30)),
            ),
            TextButton(
              onPressed: subtract,
              child: const Text('-', style: TextStyle(fontSize: 30)),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Center(
        child: Text(
          '$data',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
