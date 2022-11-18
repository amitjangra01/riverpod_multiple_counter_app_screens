import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateNotifierScreen extends ConsumerWidget {
  const StateNotifierScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateNotifierCount = ref.watch(stateNotifierProvider);
    final slider = ref.watch(sliderNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('State Notifier Screen'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.invalidate(stateNotifierProvider);
              ref.invalidate(sliderNotifierProvider);
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$stateNotifierCount',
            style: const TextStyle(fontSize: 40.0),
          ),
          Text('$slider'),
          Slider(
            value:
                ref.read(sliderNotifierProvider.notifier).slideCount.toDouble(),
            min: 0.0,
            max: 100.0,
            onChanged: (value) {
              ref.read(sliderNotifierProvider.notifier).sliderCount(
                    value.toInt(),
                  );
              print('$slider');
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(stateNotifierProvider.notifier).increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class StateNotifierClass extends StateNotifier<int> {
  StateNotifierClass() : super(0);

  void increment() {
    state++;
  }
}

final stateNotifierProvider =
    StateNotifierProvider.autoDispose<StateNotifierClass, int>(
  (ref) => StateNotifierClass(),
);

// Here by using .autoDispose we are clearing the data of our counter after leaving the current page.

class SliderNotifier extends StateNotifier<int> {
  SliderNotifier() : super(0);

  int slideCount = 1;

  void sliderCount(int value) {
    slideCount = value;
    state = slideCount;
  }
  /* Here we can also directly assign the value to state also but 
     i have done this via this variable slideCount */
}

final sliderNotifierProvider =
    StateNotifierProvider<SliderNotifier, int>((ref) => SliderNotifier());
