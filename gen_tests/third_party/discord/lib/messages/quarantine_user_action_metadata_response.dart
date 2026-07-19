// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:meta/meta.dart';

@immutable
class QuarantineUserActionMetadataResponse {
  const QuarantineUserActionMetadataResponse();

  /// Converts a `Map<String, dynamic>` to a [QuarantineUserActionMetadataResponse].
  factory QuarantineUserActionMetadataResponse.fromJson(
    Map<String, dynamic> _,
  ) {
    return const QuarantineUserActionMetadataResponse();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static QuarantineUserActionMetadataResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return QuarantineUserActionMetadataResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
