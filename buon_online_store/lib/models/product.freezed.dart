// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Product _$ProductFromJson(Map<String, dynamic> json) {
  return _Product.fromJson(json);
}

/// @nodoc
mixin _$Product {
  String get name => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  List<String> get availableColors => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  bool get isCustom => throw _privateConstructorUsedError;
  bool get isBestSeller => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductCopyWith<Product> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCopyWith<$Res> {
  factory $ProductCopyWith(Product value, $Res Function(Product) then) =
      _$ProductCopyWithImpl<$Res, Product>;
  @useResult
  $Res call(
      {String name,
      String category,
      String description,
      List<String> imageUrls,
      List<String> availableColors,
      double price,
      bool isCustom,
      bool isBestSeller});
}

/// @nodoc
class _$ProductCopyWithImpl<$Res, $Val extends Product>
    implements $ProductCopyWith<$Res> {
  _$ProductCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? category = null,
    Object? description = null,
    Object? imageUrls = null,
    Object? availableColors = null,
    Object? price = null,
    Object? isCustom = null,
    Object? isBestSeller = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableColors: null == availableColors
          ? _value.availableColors
          : availableColors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
      isBestSeller: null == isBestSeller
          ? _value.isBestSeller
          : isBestSeller // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductImplCopyWith<$Res> implements $ProductCopyWith<$Res> {
  factory _$$ProductImplCopyWith(
          _$ProductImpl value, $Res Function(_$ProductImpl) then) =
      __$$ProductImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String category,
      String description,
      List<String> imageUrls,
      List<String> availableColors,
      double price,
      bool isCustom,
      bool isBestSeller});
}

/// @nodoc
class __$$ProductImplCopyWithImpl<$Res>
    extends _$ProductCopyWithImpl<$Res, _$ProductImpl>
    implements _$$ProductImplCopyWith<$Res> {
  __$$ProductImplCopyWithImpl(
      _$ProductImpl _value, $Res Function(_$ProductImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? category = null,
    Object? description = null,
    Object? imageUrls = null,
    Object? availableColors = null,
    Object? price = null,
    Object? isCustom = null,
    Object? isBestSeller = null,
  }) {
    return _then(_$ProductImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      availableColors: null == availableColors
          ? _value._availableColors
          : availableColors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      isCustom: null == isCustom
          ? _value.isCustom
          : isCustom // ignore: cast_nullable_to_non_nullable
              as bool,
      isBestSeller: null == isBestSeller
          ? _value.isBestSeller
          : isBestSeller // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductImpl with DiagnosticableTreeMixin implements _Product {
  const _$ProductImpl(
      {required this.name,
      required this.category,
      required this.description,
      required final List<String> imageUrls,
      required final List<String> availableColors,
      required this.price,
      this.isCustom = false,
      this.isBestSeller = false})
      : _imageUrls = imageUrls,
        _availableColors = availableColors;

  factory _$ProductImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductImplFromJson(json);

  @override
  final String name;
  @override
  final String category;
  @override
  final String description;
  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  final List<String> _availableColors;
  @override
  List<String> get availableColors {
    if (_availableColors is EqualUnmodifiableListView) return _availableColors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_availableColors);
  }

  @override
  final double price;
  @override
  @JsonKey()
  final bool isCustom;
  @override
  @JsonKey()
  final bool isBestSeller;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Product(name: $name, category: $category, description: $description, imageUrls: $imageUrls, availableColors: $availableColors, price: $price, isCustom: $isCustom, isBestSeller: $isBestSeller)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Product'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('description', description))
      ..add(DiagnosticsProperty('imageUrls', imageUrls))
      ..add(DiagnosticsProperty('availableColors', availableColors))
      ..add(DiagnosticsProperty('price', price))
      ..add(DiagnosticsProperty('isCustom', isCustom))
      ..add(DiagnosticsProperty('isBestSeller', isBestSeller));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality()
                .equals(other._availableColors, _availableColors) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.isCustom, isCustom) ||
                other.isCustom == isCustom) &&
            (identical(other.isBestSeller, isBestSeller) ||
                other.isBestSeller == isBestSeller));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      category,
      description,
      const DeepCollectionEquality().hash(_imageUrls),
      const DeepCollectionEquality().hash(_availableColors),
      price,
      isCustom,
      isBestSeller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      __$$ProductImplCopyWithImpl<_$ProductImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductImplToJson(
      this,
    );
  }
}

abstract class _Product implements Product {
  const factory _Product(
      {required final String name,
      required final String category,
      required final String description,
      required final List<String> imageUrls,
      required final List<String> availableColors,
      required final double price,
      final bool isCustom,
      final bool isBestSeller}) = _$ProductImpl;

  factory _Product.fromJson(Map<String, dynamic> json) = _$ProductImpl.fromJson;

  @override
  String get name;
  @override
  String get category;
  @override
  String get description;
  @override
  List<String> get imageUrls;
  @override
  List<String> get availableColors;
  @override
  double get price;
  @override
  bool get isCustom;
  @override
  bool get isBestSeller;
  @override
  @JsonKey(ignore: true)
  _$$ProductImplCopyWith<_$ProductImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
