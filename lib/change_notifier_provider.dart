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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            '${ref.read(changeNotifierProvider).slider}',
            style: const TextStyle(fontSize: 40.0),
          ),
          Slider(
              value: changeNotifierCounter.slider.toDouble(),
              min: 0.0,
              max: 100.0,
              onChanged: (value) {
                ref.read(changeNotifierProvider).sliderValue(value.toInt());
              }),
          Text(
            '${changeNotifierCounter.value}',
            style: const TextStyle(fontSize: 40.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: const Text('Increase 10'),
                onPressed: () {
                  ref.read(changeNotifierProvider).increamentBy10();
                },
              ),
              ElevatedButton(
                child: const Text('Decrease 10'),
                onPressed: () {
                  ref.read(changeNotifierProvider).decreamentBy10();
                },
              ),
            ],
          ),
        ],
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
  int slider = 0;

  void sliderValue(int value) {
    slider = value;
    notifyListeners();
  }

  void increament() {
    value++;
    notifyListeners();
  }

  void increamentBy10() {
    // value = value + 10;
    /* we can also do this something like this but
     the lower line syntax is more convenient way of doing this.
    */
    value += 10;
    notifyListeners();
  }

  void decreamentBy10() {
    if (value >= 10) {
      value -= 10;
      notifyListeners();
    }
  }
}

final changeNotifierProvider =
    ChangeNotifierProvider<ChangeNotifierClass>((ref) => ChangeNotifierClass());
