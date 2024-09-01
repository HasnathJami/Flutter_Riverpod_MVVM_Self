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

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: Consumer(builder: (context, refValue, child) {
          final value = refValue.watch(counterStateProvider);
          return Text(
            'Value: $value',
            style: Theme.of(context).textTheme.headlineMedium,
          );
        }),
      ),
      floatingActionButton: Consumer(builder: (context, refValue, child) {
        return FloatingActionButton(
          onPressed: () {
            refValue.read(counterStateProvider.notifier).state++;
          },
          child: Icon(Icons.add),
        );
      }),
    );
  }
}
