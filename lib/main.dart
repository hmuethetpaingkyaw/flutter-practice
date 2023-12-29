import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key});

  @override
  Widget build(BuildContext context) {
    RxInt _counter = 0.obs;
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Counter'),
      ),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => Text(
                'Counter is $_counter',
                style: const TextStyle(fontSize: 30),
              ),
            ),
            IconButton(
                onPressed: () {
                  _counter++;
                },
                icon: const Icon(Icons.add)),
            IconButton(
                onPressed: () {
                  _counter--;
                },
                icon: const Icon(Icons.remove))
          ],
        ),
      ),
    );
  }
}
