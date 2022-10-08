import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChangeNotifierScreen extends ConsumerWidget {
  const ChangeNotifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final changeNotifierCounter = ref.watch(changeNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Notifier Screen'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios)),
        actions: [
          IconButton(
              onPressed: () {
                ref.invalidate(changeNotifierProvider);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Center(
        child: Text(
          '${changeNotifierCounter.value}',
          style: const TextStyle(fontSize: 40.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(changeNotifierProvider).increament();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ChangeNotifierClass extends ChangeNotifier {
  ChangeNotifierClass() : super();

  int value = 0;

  void increament() {
    value++;
    notifyListeners();
  }
}

final changeNotifierProvider =
    ChangeNotifierProvider<ChangeNotifierClass>((ref) => ChangeNotifierClass());
