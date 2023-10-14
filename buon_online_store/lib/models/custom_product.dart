import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'custom_product.freezed.dart';
part 'custom_product.g.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String name,
    required String description,
    required List<String> imageUrls,
    required double price,
    @Default(false) bool isCustom,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
