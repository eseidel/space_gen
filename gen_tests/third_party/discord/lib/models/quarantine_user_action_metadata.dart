import 'package:meta/meta.dart';

@immutable
class QuarantineUserActionMetadata {
  const QuarantineUserActionMetadata();

  /// Converts a `Map<String, dynamic>` to a [QuarantineUserActionMetadata].
  factory QuarantineUserActionMetadata.fromJson(Map<String, dynamic> _) {
    return const QuarantineUserActionMetadata();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static QuarantineUserActionMetadata? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return QuarantineUserActionMetadata.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
