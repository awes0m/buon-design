import 'dart:convert';

class CartItem {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
  });
  CartItem copyWith({
    String? id,
    String? title,
    double? price,
    int? quantity,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      quantity: quantity ?? this.quantity,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity,
    };
  }
  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      id: map['id'],
      title: map['title'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }
  String toJson() => json.encode(toMap());
  factory CartItem.fromJson(String source) => CartItem.fromMap(json.decode(source));
  @override
  String toString() {
    return 'CartItem(id: $id, title: $title, price: $price, quantity: $quantity)';
  }
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CartItem &&
      other.id == id &&
      other.title == title &&
      other.price == price &&
      other.quantity == quantity;
  }
  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      price.hashCode ^
      quantity.hashCode;
  }
}
