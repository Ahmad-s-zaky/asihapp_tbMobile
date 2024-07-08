import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:myapp/models/product.dart'; // Sesuaikan dengan path model produk Anda

class ApiServices {
  // Base URL untuk API
  static const String baseUrl = 'kartel.api.dev'; // Ganti dengan base URL sesuai API Anda

  // Headers untuk request API
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // Fungsi untuk melakukan GET request
  static Future<List<Product>> getProducts() async {
    final response = await http.get(Uri.https(baseUrl, '/products'), headers: headers);

    if (response.statusCode == 200) {
      Iterable list = jsonDecode(response.body);
      return List<Product>.from(list.map((model) => Product.fromJson(model)));
    } else {
      throw Exception('Gagal mengambil data dari API');
    }
  }

  // Fungsi untuk melakukan POST request
  static Future<Product> addProduct(Product product) async {
    final response = await http.post(
      Uri.https(baseUrl, '/products'),
      headers: headers,
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal menambahkan produk melalui API');
    }
  }

  // Fungsi untuk melakukan PUT request
  static Future<Product> updateProduct(Product product) async {
    final response = await http.put(
      Uri.https(baseUrl, '/products/${product.id}'),
      headers: headers,
      body: jsonEncode(product.toJson()),
    );

    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal memperbarui produk melalui API');
    }
  }

  // Fungsi untuk melakukan DELETE request
  static Future<void> deleteProduct(String productId) async {
    final response = await http.delete(Uri.https(baseUrl, '/products/$productId'), headers: headers);

    if (response.statusCode != 200) {
      throw Exception('Gagal menghapus produk dari API');
    }
  }
}
