// Suggested code may be subject to a license. Learn more: ~LicenseLog:2660938046.
import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServices {
  // Base URL for the API
  static const String baseUrl = 'kartel.api.dev/swagger';

  // Headers for the API requests
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Function to make a GET request
  static Future<dynamic> get(String endpoint) async {
    final response = await http.get(Uri.parse('$baseUrl/$endpoint'), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to get data from API');
    }
  }

  // Function to make a POST request
  static Future<dynamic> post(String endpoint, Map<String, dynamic> body) async {
    final response = await http.post(Uri.parse('$baseUrl/$endpoint'), headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to post data to API');
    }
  }

  // Function to make a PUT request
  static Future<dynamic> put(String endpoint, Map<String, dynamic> body) async {
    final response = await http.put(Uri.parse('$baseUrl/$endpoint'), headers: headers, body: jsonEncode(body));

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to put data to API');
    }
  }

  // Function to make a DELETE request
  static Future<dynamic> delete(String endpoint) async {
    final response = await http.delete(Uri.parse('$baseUrl/$endpoint'), headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to delete data from API');
    }
  }
}
