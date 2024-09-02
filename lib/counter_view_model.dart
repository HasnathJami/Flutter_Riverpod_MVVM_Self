import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterViewModel extends StateNotifier<int> {
  CounterViewModel() : super(0);

  //setter
  void incrementCounter() {
    state = state + 1;
  }

  //setter
  void decrementCounter() {
    state--;
  }

  //setter
  void resetCounter() {
    state = 0;
  }
}

// Define a StateNotifierProvider to expose the CounterViewModel
final counterStateProvider = StateNotifierProvider.autoDispose<CounterViewModel, int>((ref) => CounterViewModel());

// class CounterViewModel {
//   final counterStateProvider = StateProvider.autoDispose<int>((ref) => 0);
//
//   void setCounterState(WidgetRef ref) => ref.read(counterStateProvider.notifier).state++;
//
//   int getCounterState(WidgetRef ref) => ref.watch(counterStateProvider);
// }
