import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import '../models/tastings_model.dart';

class TastingsController extends GetxController {

  Future<TastingsModel> fetchTastingsData() async {

    const apiKey = 'owxdR7uk3HWimq9MO6CleX8Kt';
    const apiUrl = 'http://winemonger.nintriva.com//api/list/tastings';
    
    final response = await http.get(Uri.parse(apiUrl), headers: {
      'Apikey': apiKey,
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final order = TastingsModel.fromJson(data);

      print(data);
      print(data["Total_No_Items"]);
      return order;

    } else {
      throw Exception('Failed to load data');
    }
  }

}