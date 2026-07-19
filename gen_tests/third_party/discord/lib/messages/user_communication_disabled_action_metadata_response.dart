import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class UserCommunicationDisabledActionMetadataResponse {
  const UserCommunicationDisabledActionMetadataResponse({
    required this.durationSeconds,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [UserCommunicationDisabledActionMetadataResponse].
  factory UserCommunicationDisabledActionMetadataResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'UserCommunicationDisabledActionMetadataResponse',
      json,
      () => UserCommunicationDisabledActionMetadataResponse(
        durationSeconds: json['duration_seconds'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UserCommunicationDisabledActionMetadataResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return UserCommunicationDisabledActionMetadataResponse.fromJson(json);
  }

  final int durationSeconds;

  /// Converts a [UserCommunicationDisabledActionMetadataResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'duration_seconds': durationSeconds};
  }

  @override
  int get hashCode => durationSeconds.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserCommunicationDisabledActionMetadataResponse &&
        durationSeconds == other.durationSeconds;
  }
}
