// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Order _$OrderFromJson(Map<String, dynamic> json) {
  return _Order.fromJson(json);
}

/// @nodoc
mixin _$Order {
  String get uid => throw _privateConstructorUsedError;
  String get productName => throw _privateConstructorUsedError;
  String get productCategory => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get contactNumber => throw _privateConstructorUsedError;
  List<String> get imageUrls => throw _privateConstructorUsedError;
  List<String> get shippingAdress => throw _privateConstructorUsedError;
  bool get isConfirmed => throw _privateConstructorUsedError;
  bool get isShipped => throw _privateConstructorUsedError;
  bool get isDelivered => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderCopyWith<Order> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderCopyWith<$Res> {
  factory $OrderCopyWith(Order value, $Res Function(Order) then) =
      _$OrderCopyWithImpl<$Res, Order>;
  @useResult
  $Res call(
      {String uid,
      String productName,
      String productCategory,
      String username,
      String message,
      String contactNumber,
      List<String> imageUrls,
      List<String> shippingAdress,
      bool isConfirmed,
      bool isShipped,
      bool isDelivered});
}

/// @nodoc
class _$OrderCopyWithImpl<$Res, $Val extends Order>
    implements $OrderCopyWith<$Res> {
  _$OrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? productName = null,
    Object? productCategory = null,
    Object? username = null,
    Object? message = null,
    Object? contactNumber = null,
    Object? imageUrls = null,
    Object? shippingAdress = null,
    Object? isConfirmed = null,
    Object? isShipped = null,
    Object? isDelivered = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productCategory: null == productCategory
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value.imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shippingAdress: null == shippingAdress
          ? _value.shippingAdress
          : shippingAdress // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isConfirmed: null == isConfirmed
          ? _value.isConfirmed
          : isConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      isShipped: null == isShipped
          ? _value.isShipped
          : isShipped // ignore: cast_nullable_to_non_nullable
              as bool,
      isDelivered: null == isDelivered
          ? _value.isDelivered
          : isDelivered // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OrderImplCopyWith<$Res> implements $OrderCopyWith<$Res> {
  factory _$$OrderImplCopyWith(
          _$OrderImpl value, $Res Function(_$OrderImpl) then) =
      __$$OrderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String productName,
      String productCategory,
      String username,
      String message,
      String contactNumber,
      List<String> imageUrls,
      List<String> shippingAdress,
      bool isConfirmed,
      bool isShipped,
      bool isDelivered});
}

/// @nodoc
class __$$OrderImplCopyWithImpl<$Res>
    extends _$OrderCopyWithImpl<$Res, _$OrderImpl>
    implements _$$OrderImplCopyWith<$Res> {
  __$$OrderImplCopyWithImpl(
      _$OrderImpl _value, $Res Function(_$OrderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? productName = null,
    Object? productCategory = null,
    Object? username = null,
    Object? message = null,
    Object? contactNumber = null,
    Object? imageUrls = null,
    Object? shippingAdress = null,
    Object? isConfirmed = null,
    Object? isShipped = null,
    Object? isDelivered = null,
  }) {
    return _then(_$OrderImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      productName: null == productName
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String,
      productCategory: null == productCategory
          ? _value.productCategory
          : productCategory // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      contactNumber: null == contactNumber
          ? _value.contactNumber
          : contactNumber // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrls: null == imageUrls
          ? _value._imageUrls
          : imageUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      shippingAdress: null == shippingAdress
          ? _value._shippingAdress
          : shippingAdress // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isConfirmed: null == isConfirmed
          ? _value.isConfirmed
          : isConfirmed // ignore: cast_nullable_to_non_nullable
              as bool,
      isShipped: null == isShipped
          ? _value.isShipped
          : isShipped // ignore: cast_nullable_to_non_nullable
              as bool,
      isDelivered: null == isDelivered
          ? _value.isDelivered
          : isDelivered // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OrderImpl with DiagnosticableTreeMixin implements _Order {
  const _$OrderImpl(
      {required this.uid,
      required this.productName,
      required this.productCategory,
      required this.username,
      required this.message,
      required this.contactNumber,
      required final List<String> imageUrls,
      required final List<String> shippingAdress,
      this.isConfirmed = false,
      this.isShipped = false,
      this.isDelivered = false})
      : _imageUrls = imageUrls,
        _shippingAdress = shippingAdress;

  factory _$OrderImpl.fromJson(Map<String, dynamic> json) =>
      _$$OrderImplFromJson(json);

  @override
  final String uid;
  @override
  final String productName;
  @override
  final String productCategory;
  @override
  final String username;
  @override
  final String message;
  @override
  final String contactNumber;
  final List<String> _imageUrls;
  @override
  List<String> get imageUrls {
    if (_imageUrls is EqualUnmodifiableListView) return _imageUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_imageUrls);
  }

  final List<String> _shippingAdress;
  @override
  List<String> get shippingAdress {
    if (_shippingAdress is EqualUnmodifiableListView) return _shippingAdress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shippingAdress);
  }

  @override
  @JsonKey()
  final bool isConfirmed;
  @override
  @JsonKey()
  final bool isShipped;
  @override
  @JsonKey()
  final bool isDelivered;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Order(uid: $uid, productName: $productName, productCategory: $productCategory, username: $username, message: $message, contactNumber: $contactNumber, imageUrls: $imageUrls, shippingAdress: $shippingAdress, isConfirmed: $isConfirmed, isShipped: $isShipped, isDelivered: $isDelivered)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Order'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('productName', productName))
      ..add(DiagnosticsProperty('productCategory', productCategory))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('contactNumber', contactNumber))
      ..add(DiagnosticsProperty('imageUrls', imageUrls))
      ..add(DiagnosticsProperty('shippingAdress', shippingAdress))
      ..add(DiagnosticsProperty('isConfirmed', isConfirmed))
      ..add(DiagnosticsProperty('isShipped', isShipped))
      ..add(DiagnosticsProperty('isDelivered', isDelivered));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OrderImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.productName, productName) ||
                other.productName == productName) &&
            (identical(other.productCategory, productCategory) ||
                other.productCategory == productCategory) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.contactNumber, contactNumber) ||
                other.contactNumber == contactNumber) &&
            const DeepCollectionEquality()
                .equals(other._imageUrls, _imageUrls) &&
            const DeepCollectionEquality()
                .equals(other._shippingAdress, _shippingAdress) &&
            (identical(other.isConfirmed, isConfirmed) ||
                other.isConfirmed == isConfirmed) &&
            (identical(other.isShipped, isShipped) ||
                other.isShipped == isShipped) &&
            (identical(other.isDelivered, isDelivered) ||
                other.isDelivered == isDelivered));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      productName,
      productCategory,
      username,
      message,
      contactNumber,
      const DeepCollectionEquality().hash(_imageUrls),
      const DeepCollectionEquality().hash(_shippingAdress),
      isConfirmed,
      isShipped,
      isDelivered);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      __$$OrderImplCopyWithImpl<_$OrderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OrderImplToJson(
      this,
    );
  }
}

abstract class _Order implements Order {
  const factory _Order(
      {required final String uid,
      required final String productName,
      required final String productCategory,
      required final String username,
      required final String message,
      required final String contactNumber,
      required final List<String> imageUrls,
      required final List<String> shippingAdress,
      final bool isConfirmed,
      final bool isShipped,
      final bool isDelivered}) = _$OrderImpl;

  factory _Order.fromJson(Map<String, dynamic> json) = _$OrderImpl.fromJson;

  @override
  String get uid;
  @override
  String get productName;
  @override
  String get productCategory;
  @override
  String get username;
  @override
  String get message;
  @override
  String get contactNumber;
  @override
  List<String> get imageUrls;
  @override
  List<String> get shippingAdress;
  @override
  bool get isConfirmed;
  @override
  bool get isShipped;
  @override
  bool get isDelivered;
  @override
  @JsonKey(ignore: true)
  _$$OrderImplCopyWith<_$OrderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
