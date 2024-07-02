import 'package:myapp/models/stock.dart';

class Product{
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1329582442.
  final int id;
  final String name;
  final int quantity;
  final List<Stock> stocks;

  Product({
    required this.id,
    required this.name,
    required this.quantity,
    required this.stocks,
  });

  Product copyWith({
    int? id,
    String? name,
    int? quantity,
    List<Stock>? stocks,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
      stocks: stocks ?? this.stocks,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
      'stocks': stocks.map((x) => x.toMap()).toList(),
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as int,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
      stocks: List<Stock>.from(
        (map['stocks'] as List<int>).map<Stock>(
          (x) => Stock.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() =>
      'Product(id: $id, name: $name, quantity: $quantity, stocks: $stocks)';

  @override
  String toString() => 'Product(id: $id, name: $name, quantity: $quantity, stocks: $stocks)';
}