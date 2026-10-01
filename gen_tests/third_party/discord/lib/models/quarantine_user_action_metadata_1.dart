// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';

@immutable
class QuarantineUserActionMetadata1 {
  const QuarantineUserActionMetadata1();

  /// Converts a `Map<String, dynamic>` to a [QuarantineUserActionMetadata1].
  factory QuarantineUserActionMetadata1.fromJson(Map<String, dynamic> _) {
    return const QuarantineUserActionMetadata1();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static QuarantineUserActionMetadata1? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return QuarantineUserActionMetadata1.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
