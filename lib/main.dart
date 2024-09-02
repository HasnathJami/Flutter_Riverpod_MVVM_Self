import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'counter_view_model.dart';

void main() {
  runApp(ProviderScope(
    child: MaterialApp(
      title: 'Counter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    ),
  ));
}

// The main widget that displays the counter value and a button to increment it
class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the ViewModel to call methods
    final counterVM = ref.read(counterStateProvider.notifier);

    print('MyHomePage build');

    // Watch the counter state from the provider
    // final counter = ref.watch(counterStateProvider);

    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, refValue, child) {
          // Watch the counter state from the provider
          final counter = refValue.watch(counterStateProvider);
          return Text(
            'Value: $counter',
            style: Theme.of(context).textTheme.headlineMedium,
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Increment the counter by calling the method in the ViewModel
          // ref.read(counterStateProvider.notifier).incrementCounter();
          counterVM.incrementCounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
