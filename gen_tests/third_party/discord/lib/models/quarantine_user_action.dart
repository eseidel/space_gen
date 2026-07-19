import 'package:discord/model_helpers.dart';
import 'package:discord/models/automod_action_type.dart';
import 'package:discord/models/quarantine_user_action_metadata_1.dart';
import 'package:meta/meta.dart';

@immutable
class QuarantineUserAction {
  const QuarantineUserAction({this.metadata});

  /// Converts a `Map<String, dynamic>` to a [QuarantineUserAction].
  factory QuarantineUserAction.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'QuarantineUserAction',
      json,
      () => QuarantineUserAction(
        metadata: QuarantineUserActionMetadata1.maybeFromJson(
          json['metadata'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static QuarantineUserAction? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return QuarantineUserAction.fromJson(json);
  }

  AutomodActionType get type => AutomodActionType.quarantineUser;
  final QuarantineUserActionMetadata1? metadata;

  /// Converts a [QuarantineUserAction] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'metadata': metadata?.toJson()};
  }

  @override
  int get hashCode => metadata.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is QuarantineUserAction && metadata == other.metadata;
  }
}
