import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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

final counterStateProvider = StateProvider.autoDispose<int>((ref) {
  return 0;
});

class MyHomePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('MyHomePage build');
    return Scaffold(
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            final value = ref.watch(counterStateProvider);
            return Text(
              'Value: $value',
              style: Theme.of(context).textTheme.headlineMedium,
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterStateProvider.notifier).state++;
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
