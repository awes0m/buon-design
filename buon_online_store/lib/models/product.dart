import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String name,
    required String category,
    required String description,
    required List<String> imageUrls,
    required List<String> availableColors,
    required double price,
    @Default(false) bool isCustom,
    @Default(false) bool isBestSeller,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
