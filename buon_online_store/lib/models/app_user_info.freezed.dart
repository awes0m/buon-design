// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_user_info.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppUserInfo _$AppUserInfoFromJson(Map<String, dynamic> json) {
  return _UserInfo.fromJson(json);
}

/// @nodoc
mixin _$AppUserInfo {
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get profilePhoto => throw _privateConstructorUsedError;
  String get phoneNumber => throw _privateConstructorUsedError;
  List<String> get address => throw _privateConstructorUsedError;
  List<String> get orderIds => throw _privateConstructorUsedError;
  List<String> get cartItemIds => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppUserInfoCopyWith<AppUserInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppUserInfoCopyWith<$Res> {
  factory $AppUserInfoCopyWith(
          AppUserInfo value, $Res Function(AppUserInfo) then) =
      _$AppUserInfoCopyWithImpl<$Res, AppUserInfo>;
  @useResult
  $Res call(
      {String uid,
      String name,
      String email,
      String profilePhoto,
      String phoneNumber,
      List<String> address,
      List<String> orderIds,
      List<String> cartItemIds});
}

/// @nodoc
class _$AppUserInfoCopyWithImpl<$Res, $Val extends AppUserInfo>
    implements $AppUserInfoCopyWith<$Res> {
  _$AppUserInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? email = null,
    Object? profilePhoto = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? orderIds = null,
    Object? cartItemIds = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhoto: null == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as List<String>,
      orderIds: null == orderIds
          ? _value.orderIds
          : orderIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cartItemIds: null == cartItemIds
          ? _value.cartItemIds
          : cartItemIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserInfoImplCopyWith<$Res>
    implements $AppUserInfoCopyWith<$Res> {
  factory _$$UserInfoImplCopyWith(
          _$UserInfoImpl value, $Res Function(_$UserInfoImpl) then) =
      __$$UserInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String name,
      String email,
      String profilePhoto,
      String phoneNumber,
      List<String> address,
      List<String> orderIds,
      List<String> cartItemIds});
}

/// @nodoc
class __$$UserInfoImplCopyWithImpl<$Res>
    extends _$AppUserInfoCopyWithImpl<$Res, _$UserInfoImpl>
    implements _$$UserInfoImplCopyWith<$Res> {
  __$$UserInfoImplCopyWithImpl(
      _$UserInfoImpl _value, $Res Function(_$UserInfoImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? name = null,
    Object? email = null,
    Object? profilePhoto = null,
    Object? phoneNumber = null,
    Object? address = null,
    Object? orderIds = null,
    Object? cartItemIds = null,
  }) {
    return _then(_$UserInfoImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhoto: null == profilePhoto
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: null == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value._address
          : address // ignore: cast_nullable_to_non_nullable
              as List<String>,
      orderIds: null == orderIds
          ? _value._orderIds
          : orderIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      cartItemIds: null == cartItemIds
          ? _value._cartItemIds
          : cartItemIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserInfoImpl with DiagnosticableTreeMixin implements _UserInfo {
  const _$UserInfoImpl(
      {required this.uid,
      required this.name,
      required this.email,
      this.profilePhoto = '',
      this.phoneNumber = '',
      final List<String> address = const [],
      final List<String> orderIds = const [],
      final List<String> cartItemIds = const []})
      : _address = address,
        _orderIds = orderIds,
        _cartItemIds = cartItemIds;

  factory _$UserInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserInfoImplFromJson(json);

  @override
  final String uid;
  @override
  final String name;
  @override
  final String email;
  @override
  @JsonKey()
  final String profilePhoto;
  @override
  @JsonKey()
  final String phoneNumber;
  final List<String> _address;
  @override
  @JsonKey()
  List<String> get address {
    if (_address is EqualUnmodifiableListView) return _address;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_address);
  }

  final List<String> _orderIds;
  @override
  @JsonKey()
  List<String> get orderIds {
    if (_orderIds is EqualUnmodifiableListView) return _orderIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orderIds);
  }

  final List<String> _cartItemIds;
  @override
  @JsonKey()
  List<String> get cartItemIds {
    if (_cartItemIds is EqualUnmodifiableListView) return _cartItemIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cartItemIds);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AppUserInfo(uid: $uid, name: $name, email: $email, profilePhoto: $profilePhoto, phoneNumber: $phoneNumber, address: $address, orderIds: $orderIds, cartItemIds: $cartItemIds)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AppUserInfo'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('profilePhoto', profilePhoto))
      ..add(DiagnosticsProperty('phoneNumber', phoneNumber))
      ..add(DiagnosticsProperty('address', address))
      ..add(DiagnosticsProperty('orderIds', orderIds))
      ..add(DiagnosticsProperty('cartItemIds', cartItemIds));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInfoImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.profilePhoto, profilePhoto) ||
                other.profilePhoto == profilePhoto) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            const DeepCollectionEquality().equals(other._address, _address) &&
            const DeepCollectionEquality().equals(other._orderIds, _orderIds) &&
            const DeepCollectionEquality()
                .equals(other._cartItemIds, _cartItemIds));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      name,
      email,
      profilePhoto,
      phoneNumber,
      const DeepCollectionEquality().hash(_address),
      const DeepCollectionEquality().hash(_orderIds),
      const DeepCollectionEquality().hash(_cartItemIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      __$$UserInfoImplCopyWithImpl<_$UserInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserInfoImplToJson(
      this,
    );
  }
}

abstract class _UserInfo implements AppUserInfo {
  const factory _UserInfo(
      {required final String uid,
      required final String name,
      required final String email,
      final String profilePhoto,
      final String phoneNumber,
      final List<String> address,
      final List<String> orderIds,
      final List<String> cartItemIds}) = _$UserInfoImpl;

  factory _UserInfo.fromJson(Map<String, dynamic> json) =
      _$UserInfoImpl.fromJson;

  @override
  String get uid;
  @override
  String get name;
  @override
  String get email;
  @override
  String get profilePhoto;
  @override
  String get phoneNumber;
  @override
  List<String> get address;
  @override
  List<String> get orderIds;
  @override
  List<String> get cartItemIds;
  @override
  @JsonKey(ignore: true)
  _$$UserInfoImplCopyWith<_$UserInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
