import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

class CounterHome extends ConsumerWidget {
  const CounterHome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Counter Project"),
        ),
        body: Center(
          child: Consumer(
            builder: (context, ref, _) {
              final count = ref.watch(counterProvider);
              return Text("$count");
            },
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton.extended(
                onPressed: () {
                  ref.read(counterProvider.notifier).state--;
                },
                label: const Icon(Icons.remove)),
            FloatingActionButton.extended(
                onPressed: () {
                  ref.read(counterProvider.notifier).state++;
                },
                label: const Icon(Icons.add)),
          ],
        ),
      ),
    );
  }
}