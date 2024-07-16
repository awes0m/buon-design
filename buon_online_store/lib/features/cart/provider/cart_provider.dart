// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/product.dart';

final cartProvider = StateNotifierProvider<CartList, List<CartItemModel>>(
  (ref) => CartList(),
);

class CartList extends StateNotifier<List<CartItemModel>> {
  CartList() : super([]);

  void addToCart(CartItemModel item) {
    final existingIndex = state
        .indexWhere((element) => element.product.name == item.product.name);
    if (existingIndex != -1) {
      state[existingIndex].quantity++;
    } else {
      state = [...state, item];
    }
  }

  void removeFromCart(CartItemModel item) {
    final index = state.indexOf(item);
    if (index != -1) {
      if (state[index].quantity > 1) {
        state[index].quantity--;
      } else {
        state = state.where((element) => element != item).toList();
      }
    }
  }
}

class CartItemModel {
  final Product product;
  int quantity;

  CartItemModel({required this.product, this.quantity = 1});
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, required this.quantity});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      product: Product.fromJson(map['product'] as Map<String, dynamic>),
      quantity: map['quantity'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CartItem.fromJson(String source) =>
      CartItem.fromMap(json.decode(source) as Map<String, dynamic>);
}
