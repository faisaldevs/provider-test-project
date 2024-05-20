import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/stateNotifier.dart';

final riverpodTest = StateProvider((ref) {
  return 0;
});

final updateValueProvider = StateProvider<String?>((ref){

  return null;
});

final stateNotifierTest= StateNotifierProvider<StateNotifierClass,int>((ref){

  return StateNotifierClass();
});
