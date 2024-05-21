import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test_project/api_call.dart';
import 'package:riverpod_test_project/model.dart';
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


final apiCallProvider = Provider <ApiServices>((ref) => ApiServices());

final apiFutureCallProvider = FutureProvider <DataModel>((ref){
  return ref.watch(apiCallProvider).callApi();
});


final dataProvider = FutureProvider<DataModel>((ref) => ApiServices().callApi()
    // async
// {
//   final response = await http.get(Uri.parse('https://starsoftjpn.xyz/api/v1/blood-donor'));
//   if (response.statusCode == 200) {
//     return DataModel.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load data');
//   }
// }
);