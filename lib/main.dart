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

final counterStateProvider = StateProvider<int>((ref) {
  return 0;
});

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body: Center(
        child: CounterText(),
      ),
      floatingActionButton: Consumer(builder: (context, ref, child) {
        return FloatingActionButton(
          onPressed: () {
            ref.read(counterStateProvider.notifier).state++;
          },
          child: Icon(Icons.add),
        );
      }),
    );
  }
}

class CounterText extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print('CounterText build');
    var value = ref.watch(counterStateProvider);
    return Text(
      'Value: $value',
      style: Theme.of(context).textTheme.headlineMedium,
    );
  }
}
