import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateNotifierClass extends StateNotifier<int>{
  StateNotifierClass(): super(0);
  void increment() {
    state = state + 1;
  }

  void decrement() {
    state = state - 1;
  }

}