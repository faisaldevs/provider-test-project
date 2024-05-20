import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/riverpod.dart';

class UpdateValue extends ConsumerWidget{
  const UpdateValue({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update Value"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          TextField(
            onSubmitted: (value){

              ref.read(updateValueProvider.notifier).update((state){
                return value;
              });

              print(value);
            },
          ),

          Text("${ref.watch(updateValueProvider)}"),

        ],
      ),
    );
  }
}
