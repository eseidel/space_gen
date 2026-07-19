import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class LobbyMemberResponse {
  const LobbyMemberResponse({
    required this.id,
    required this.metadata,
    required this.flags,
  });

  /// Converts a `Map<String, dynamic>` to a [LobbyMemberResponse].
  factory LobbyMemberResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LobbyMemberResponse',
      json,
      () => LobbyMemberResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        metadata: (checkedKey(json, 'metadata') as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as String),
        ),
        flags: json['flags'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LobbyMemberResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LobbyMemberResponse.fromJson(json);
  }

  final SnowflakeType id;
  final Map<String, String>? metadata;
  final int flags;

  /// Converts a [LobbyMemberResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id.toJson(), 'metadata': metadata, 'flags': flags};
  }

  @override
  int get hashCode => Object.hashAll([id, mapHash(metadata), flags]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LobbyMemberResponse &&
        id == other.id &&
        mapsEqual(metadata, other.metadata) &&
        flags == other.flags;
  }
}
