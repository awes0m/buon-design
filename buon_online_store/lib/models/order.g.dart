// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      uid: json['uid'] as String,
      productName: json['productName'] as String,
      username: json['username'] as String,
      message: json['message'] as String,
      contactNumber: json['contactNumber'] as String,
      shippingAdress: (json['shippingAdress'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      isConfirmed: json['isConfirmed'] as bool? ?? false,
      isShipped: json['isShipped'] as bool? ?? false,
      isDelivered: json['isDelivered'] as bool? ?? false,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'productName': instance.productName,
      'username': instance.username,
      'message': instance.message,
      'contactNumber': instance.contactNumber,
      'shippingAdress': instance.shippingAdress,
      'isConfirmed': instance.isConfirmed,
      'isShipped': instance.isShipped,
      'isDelivered': instance.isDelivered,
    };
