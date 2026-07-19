import 'package:discord/messages/quarantine_user_action_metadata_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_action_type.dart';
import 'package:meta/meta.dart';

@immutable
class QuarantineUserActionResponse {
  const QuarantineUserActionResponse({required this.metadata});

  /// Converts a `Map<String, dynamic>` to a [QuarantineUserActionResponse].
  factory QuarantineUserActionResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'QuarantineUserActionResponse',
      json,
      () => QuarantineUserActionResponse(
        metadata: QuarantineUserActionMetadataResponse.fromJson(
          json['metadata'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static QuarantineUserActionResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return QuarantineUserActionResponse.fromJson(json);
  }

  AutomodActionType get type => AutomodActionType.quarantineUser;
  final QuarantineUserActionMetadataResponse metadata;

  /// Converts a [QuarantineUserActionResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'metadata': metadata.toJson()};
  }

  @override
  int get hashCode => metadata.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is QuarantineUserActionResponse && metadata == other.metadata;
  }
}
