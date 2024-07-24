import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void countDown() {
    if (counter > 0) {
      setState(() {
        counter--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$counter'),
              TextButton(
                onPressed: () => setState(() => counter++),
                child: const Text('Up'),
              ),
              TextButton(
                onPressed: countDown,
                child: const Text('Down'),
              ),
              TextButton(
                onPressed: () => setState(() => counter = 0),
                child: const Text('Initialize'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
