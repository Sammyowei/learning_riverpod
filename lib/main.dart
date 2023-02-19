import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning_riverpod/counter_project/counter_project.dart';

final helloWorldProvider = Provider((ref) => "Hello World!");
final counterProvider = StateProvider((ref) {
  return 0;
});

void main() {
  runApp(
    const ProviderScope(
      child: CounterHome(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String value = ref.watch(helloWorldProvider);
    final counter = ref.watch(counterProvider);

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("RiverPod Example"),
        ),
        body: Center(
          child: Text("$counter"),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final counter = ref.read(counterProvider.notifier);

            counter.state++;
          },
        ),
      ),
    );
  }
}
