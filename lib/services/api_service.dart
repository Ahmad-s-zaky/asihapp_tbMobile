import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/stock_model.dart';

class ApiService {
  final String apiUrl = "https://api.kartel.dev/stocks";

  Future<List<Stock>> fetchStocks() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((stock) => Stock.fromJson(stock)).toList();
    } else {
      throw Exception('Failed to load stocks');
    }
  }

  Future<Stock> createStock(Stock stock) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(stock.toJson()),
    );

    if (response.statusCode == 201) {
      return Stock.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to create stock');
    }
  }

  Future<Stock> updateStock(Stock stock) async {
    final response = await http.put(
      Uri.parse('$apiUrl/${stock.id}'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(stock.toJson()),
    );

    if (response.statusCode == 200) {
      return Stock.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update stock');
    }
  }

  Future<void> deleteStock(String id) async {
    final response = await http.delete(Uri.parse('$apiUrl/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete stock');
    }
  }
}
