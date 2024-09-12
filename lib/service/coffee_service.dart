import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:kaui_cs/data/local/model/coffee.dart';

class CoffeeService {
  Future<List<Coffee>> fetchCoffees() async {
    final String response =
        await rootBundle.loadString('assets/coffee_data.json');
    final List<dynamic> data = json.decode(response) as List;
    return data
        .map((item) => Coffee.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
