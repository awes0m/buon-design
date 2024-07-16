// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserInfoImpl _$$AppUserInfoImplFromJson(Map<String, dynamic> json) =>
    _$AppUserInfoImpl(
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
      cartItemIds: json['cartItemIds'] as String? ?? '',
      favouriteIds: (json['favouriteIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AppUserInfoImplToJson(_$AppUserInfoImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'profilePhoto': instance.profilePhoto,
      'phoneNumber': instance.phoneNumber,
      'address': instance.address,
      'orderIds': instance.orderIds,
      'cartItemIds': instance.cartItemIds,
      'favouriteIds': instance.favouriteIds,
    };
