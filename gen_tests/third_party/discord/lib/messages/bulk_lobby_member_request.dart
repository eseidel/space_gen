import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/bulk_lobby_member_request_flags_one_of_1.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class BulkLobbyMemberRequest {
  BulkLobbyMemberRequest({
    required this.id,
    this.metadata,
    this.flags,
    this.removeMember,
  }) {
    metadata?.validate(maxProperties: 25);
  }

  /// Converts a `Map<String, dynamic>` to a [BulkLobbyMemberRequest].
  factory BulkLobbyMemberRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BulkLobbyMemberRequest',
      json,
      () => BulkLobbyMemberRequest(
        id: SnowflakeType.fromJson(json['id'] as String),
        metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        flags: BulkLobbyMemberRequestFlagsOneOf1.maybeFromJson(
          json['flags'] as int?,
        ),
        removeMember: json['remove_member'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BulkLobbyMemberRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BulkLobbyMemberRequest.fromJson(json);
  }

  final SnowflakeType id;
  final Map<String, String>? metadata;
  final BulkLobbyMemberRequestFlagsOneOf1? flags;
  final bool? removeMember;

  /// Converts a [BulkLobbyMemberRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'metadata': metadata,
      'flags': flags?.toJson(),
      'remove_member': removeMember,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, mapHash(metadata), flags, removeMember]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BulkLobbyMemberRequest &&
        id == other.id &&
        mapsEqual(metadata, other.metadata) &&
        flags == other.flags &&
        removeMember == other.removeMember;
  }
}
