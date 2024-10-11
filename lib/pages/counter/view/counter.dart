import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:contact_app/pages/counter/provider/counter_provider.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              context.read<CounterProvider>().reset();
            },
            icon: const Icon(Icons.refresh),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        title: const Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${context.watch<CounterProvider>().counter}",
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              "${context.watch<CounterProvider>().counterRemove}",
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              "${context.watch<CounterProvider>().counterX2}",
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              "${context.watch<CounterProvider>().counterX3}",
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
            Text(
              "${context.watch<CounterProvider>().counterX4}",
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // x4
            FloatingActionButton(
              onPressed: () {
                context.read<CounterProvider>().x4();
              },
              child: const Text("X4"),
            ),
            // x3
            FloatingActionButton(
              onPressed: () {
                context.read<CounterProvider>().x3();
              },
              child: const Text("X3"),
            ),
            // x2
            FloatingActionButton(
              onPressed: () {
                context.read<CounterProvider>().x2();
              },
              child: const Text("X2"),
            ),
            // decrement
            FloatingActionButton(
              onPressed: () {
                context.read<CounterProvider>().decrement();
              },
              child: const Icon(Icons.remove),
            ),
            // increment
            FloatingActionButton(
              onPressed: () {
                context.read<CounterProvider>().increment();
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
