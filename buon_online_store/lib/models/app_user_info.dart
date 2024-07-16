import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user_info.freezed.dart';
part 'app_user_info.g.dart';

@freezed
class AppUserInfo with _$AppUserInfo {
  const factory AppUserInfo({
    required String uid,
    required String name,
    required String email,
    @Default('') String profilePhoto,
    @Default('') String phoneNumber,
    @Default([]) List<String> address,
    @Default([]) List<String> orderIds,
    @Default('') String cartItemIds,
    @Default([]) List<String> favouriteIds,
  }) = _AppUserInfo;

  factory AppUserInfo.fromJson(Map<String, dynamic> json) =>
      _$AppUserInfoFromJson(json);
}
