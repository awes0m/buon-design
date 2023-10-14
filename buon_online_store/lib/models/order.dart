import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class Order with _$Order {
  const factory Order({
    required String uid,
    required String productName,
    required String username,
    required String message,
    required String contactNumber,
    required List<String> shippingAdress,
    @Default(false) bool isConfirmed,
    @Default(false) bool isShipped,
    @Default(false) bool isDelivered,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
