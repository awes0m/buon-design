// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      profilePhoto: json['profilePhoto'] as String? ?? '',
      phoneNumber: json['phoneNumber'] as String? ?? '',
      address: (json['address'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      orderIds: (json['orderIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      cartItemIds: (json['cartItemIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'profilePhoto': instance.profilePhoto,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'orderIds': instance.orderIds,
      'cartItemIds': instance.cartItemIds,
    };
