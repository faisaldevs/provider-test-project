import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:riverpod_test_project/model.dart';

class ApiServices{
  String apiUrl = "https://starsoftjpn.xyz/api/v1/blood-donor";

 Future<DataModel> callApi()async{
    var res = await http.get(Uri.parse("https://starsoftjpn.xyz/api/v1/blood-donor"));
   if(res.statusCode == 200){
     final Map<String, dynamic> responseData = jsonDecode(res.body);
     print(res.statusCode);
     print(res.body);
     return DataModel.fromJson(responseData);
   }else{
     print("object");
     throw Exception('Failed to load data');
   }
  }

}