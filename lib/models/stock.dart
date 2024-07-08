class Stock {
  final int id;
  final String name;
  final int quantity;

  Stock({
    required this.id,
    required this.name, 
    required this.quantity,
  });

  Stock copyWith({
    int? id,
    String? name,
    int? quantity,
  }) {
    return Stock(
      id: id ?? this.id,
      name: name ?? this.name,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'quantity': quantity,
    };
  }

  factory Stock.fromMap(Map<String, dynamic> map) {
    return Stock(
      id: map['id'] as int,
      name: map['name'] as String,
      quantity: map['quantity'] as int,
    );
  }

  String toJson() =>
      'Stock(id: $id, name: $name, quantity: $quantity)';

  @override
  String toString() => 'Stock(id: $id, name: $name, quantity: $quantity)';
}
