import 'package:flutter/material.dart';
import 'package:myapp/models/product.dart';

class ProductService extends ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  void addProduct(Product product) {
    _products.add(product);
    notifyListeners();
  }

  void updateProduct(int index, Product product) {
    _products[index] = product;
    notifyListeners();
  }

  void deleteProduct(int index) {
    _products.removeAt(index);
    notifyListeners();
  }
}