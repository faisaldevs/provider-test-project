import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/riverpod.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  final int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Consumer(
        builder: (context, ref,child) {
          return Center(

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  // '$_counter',
                  "${ref.watch(stateNotifierTest)}",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          );
        }
      ),
      floatingActionButton: Consumer(
        builder: (context, ref,child) {
          return FloatingActionButton(
            onPressed: (){
              // ref.read(riverpodTest.notifier).state++;
              ref.read(stateNotifierTest.notifier).increment();

            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          );
        }
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}