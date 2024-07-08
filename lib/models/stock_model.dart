class Stock {
  final String id;
  final String name;
  final int quantity;
  final String attr;
  final int weight;

  Stock({
    required this.id,
    required this.name,
    required this.quantity,
    required this.attr,
    required this.weight,
  });

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      id: json['id'],
      name: json['name'],
      quantity: json['qty'],
      attr: json['attr'],
      weight: json['weight'],
      
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'qty': quantity,
      'attr': attr,
      'weight': weight,
    };
  }
}
