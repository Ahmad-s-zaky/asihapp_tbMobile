class Seller {
  final int id;
  final String name;
  final int price;

  Seller({
    required this.id,
    required this.name,
    required this.price,
  });

  Seller copyWith({
    int? id,
    String? name,
    int? price,
  }) {
    return Seller(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );}
  
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
    };
  }
  factory Seller.fromMap(Map<String, dynamic> map) {
    return Seller(
      id: map['id'] as int,
      name: map['name'] as String,
      price: map['price'] as int,
    );
  }
  String toJson() => 'Seller(id: $id, name: $name, price: $price)';

  @override
  String toString() => 'Seller(id: $id, name: $name, price: $price)';
}
