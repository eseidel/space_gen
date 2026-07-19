import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UserCommunicationDisabledActionMetadata {
  const UserCommunicationDisabledActionMetadata({this.durationSeconds});

  /// Converts a `Map<String, dynamic>` to a
  /// [UserCommunicationDisabledActionMetadata].
  factory UserCommunicationDisabledActionMetadata.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UserCommunicationDisabledActionMetadata',
      json,
      () => UserCommunicationDisabledActionMetadata(
        durationSeconds: json['duration_seconds'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserCommunicationDisabledActionMetadata? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UserCommunicationDisabledActionMetadata.fromJson(json);
  }

  final int? durationSeconds;

  /// Converts a [UserCommunicationDisabledActionMetadata]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'duration_seconds': durationSeconds};
  }

  @override
  int get hashCode => durationSeconds.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserCommunicationDisabledActionMetadata &&
        durationSeconds == other.durationSeconds;
  }
}
