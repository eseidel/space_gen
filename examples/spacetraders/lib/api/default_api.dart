import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

class DefaultApi {
  Future<void> health() async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/health'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to load health');
    }
  }

  Future<void> metrics() async {
    final response = await http.post(
      Uri.parse('https://api.spacetraders.io/v2/metrics'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({}),
    );

    if (response.statusCode == 200) {
      return;
    } else {
      throw Exception('Failed to load metrics');
    }
  }
}
