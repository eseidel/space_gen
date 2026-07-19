import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class BulkBanUsersRequest {
  const BulkBanUsersRequest({required this.userIds, this.deleteMessageSeconds});

  /// Converts a `Map<String, dynamic>` to a [BulkBanUsersRequest].
  factory BulkBanUsersRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BulkBanUsersRequest',
      json,
      () => BulkBanUsersRequest(
        userIds: (json['user_ids'] as List)
            .map<SnowflakeType>((e) => SnowflakeType.fromJson(e as String))
            .toList(),
        deleteMessageSeconds: json['delete_message_seconds'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BulkBanUsersRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BulkBanUsersRequest.fromJson(json);
  }

  final List<SnowflakeType> userIds;
  final int? deleteMessageSeconds;

  /// Converts a [BulkBanUsersRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'user_ids': userIds.map((e) => e.toJson()).toList(),
      'delete_message_seconds': deleteMessageSeconds,
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(userIds), deleteMessageSeconds]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BulkBanUsersRequest &&
        listsEqual(userIds, other.userIds) &&
        deleteMessageSeconds == other.deleteMessageSeconds;
  }
}
