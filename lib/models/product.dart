class Product {
  final String id;
  final String name;
  final int price;
  final int qty;
  final String attr;
  final int weight;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.qty,
    required this.attr,
    required this.weight,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      qty: json['qty'],
      attr: json['attr'],
      weight: json['weight'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'qty': qty,
      'attr': attr,
      'weight': weight,
    };
  }

  static fromMap(Map<String, dynamic> x) {
    return Product(
      id: x['id'],
      name: x['name'],
      price: x['price'],
      qty: x['qty'],
      attr: x['attr'],
      weight: x['weight'],
    );
  }
}
