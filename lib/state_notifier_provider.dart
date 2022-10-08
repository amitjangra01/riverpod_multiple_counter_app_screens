import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateNotifierCounter = ref.watch(stateNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Screen'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(stateNotifierProvider);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Text(
          '$stateNotifierCounter',
          style: const TextStyle(fontSize: 40.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(stateNotifierProvider.notifier).increament();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class StateNotifierClass extends StateNotifier<int> {
  StateNotifierClass() : super(0);
  void increament() {
    state++;
  }
}

final stateNotifierProvider =
    StateNotifierProvider.autoDispose<StateNotifierClass, int>(
        (ref) => StateNotifierClass());

// Here by using .autoDispose we are clearing the data of our counter after leaving the current page.