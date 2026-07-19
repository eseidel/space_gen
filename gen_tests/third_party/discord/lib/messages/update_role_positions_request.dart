import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class UpdateRolePositionsRequest {
  const UpdateRolePositionsRequest({this.id, this.position});

  /// Converts a `Map<String, dynamic>` to a [UpdateRolePositionsRequest].
  factory UpdateRolePositionsRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'UpdateRolePositionsRequest',
      json,
      () => UpdateRolePositionsRequest(
        id: SnowflakeType.maybeFromJson(json['id'] as String?),
        position: json['position'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UpdateRolePositionsRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UpdateRolePositionsRequest.fromJson(json);
  }

  final SnowflakeType? id;
  final int? position;

  /// Converts a [UpdateRolePositionsRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id?.toJson(), 'position': position};
  }

  @override
  int get hashCode => Object.hashAll([id, position]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UpdateRolePositionsRequest &&
        id == other.id &&
        position == other.position;
  }
}
