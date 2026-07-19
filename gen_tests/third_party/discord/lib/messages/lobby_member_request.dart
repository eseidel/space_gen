import 'package:discord/model_helpers.dart';
import 'package:discord/models/lobby_member_request_flags_one_of_1.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class LobbyMemberRequest {
  const LobbyMemberRequest({required this.id, this.metadata, this.flags});

  /// Converts a `Map<String, dynamic>` to a [LobbyMemberRequest].
  factory LobbyMemberRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LobbyMemberRequest',
      json,
      () => LobbyMemberRequest(
        id: SnowflakeType.fromJson(json['id'] as String),
        metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        flags: LobbyMemberRequestFlagsOneOf1.maybeFromJson(
          json['flags'] as int?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LobbyMemberRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LobbyMemberRequest.fromJson(json);
  }

  final SnowflakeType id;
  final Map<String, String>? metadata;
  final LobbyMemberRequestFlagsOneOf1? flags;

  /// Converts a [LobbyMemberRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id.toJson(), 'metadata': metadata, 'flags': flags?.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([id, mapHash(metadata), flags]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LobbyMemberRequest &&
        id == other.id &&
        mapsEqual(metadata, other.metadata) &&
        flags == other.flags;
  }
}
