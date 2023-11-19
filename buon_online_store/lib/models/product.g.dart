// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      name: json['name'] as String,
      category: json['category'] as String,
      description: json['description'] as String,
      imageUrls:
          (json['imageUrls'] as List<dynamic>).map((e) => e as String).toList(),
      availableColors: (json['availableColors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      price: (json['price'] as num).toDouble(),
      isCustom: json['isCustom'] as bool? ?? false,
      isBestSeller: json['isBestSeller'] as bool? ?? false,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'category': instance.category,
      'description': instance.description,
      'imageUrls': instance.imageUrls,
      'availableColors': instance.availableColors,
      'price': instance.price,
      'isCustom': instance.isCustom,
      'isBestSeller': instance.isBestSeller,
    };
