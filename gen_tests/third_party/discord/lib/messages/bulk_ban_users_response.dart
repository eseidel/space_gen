import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class BulkBanUsersResponse {
  const BulkBanUsersResponse({
    required this.bannedUsers,
    required this.failedUsers,
  });

  /// Converts a `Map<String, dynamic>` to a [BulkBanUsersResponse].
  factory BulkBanUsersResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BulkBanUsersResponse',
      json,
      () => BulkBanUsersResponse(
        bannedUsers: (json['banned_users'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        failedUsers: (json['failed_users'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BulkBanUsersResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BulkBanUsersResponse.fromJson(json);
  }

  final List<SnowflakeType> bannedUsers;
  final List<SnowflakeType> failedUsers;

  /// Converts a [BulkBanUsersResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'banned_users': bannedUsers.map((e) => e.toJson()).toList(),
      'failed_users': failedUsers.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(bannedUsers), listHash(failedUsers)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BulkBanUsersResponse &&
        listsEqual(bannedUsers, other.bannedUsers) &&
        listsEqual(failedUsers, other.failedUsers);
  }
}
