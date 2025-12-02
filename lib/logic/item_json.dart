import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

//load json
Future<Map<String, dynamic>> loadItems() async {
  final jsonString = await rootBundle.loadString('assets/json/items.json');
  return jsonDecode(jsonString) as Map<String, dynamic>;
}