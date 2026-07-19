// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:meta/meta.dart';

@immutable
class InteractionsGetRestrictionsForAuthenticatedUser200ResponseAnyOf1 {
  const InteractionsGetRestrictionsForAuthenticatedUser200ResponseAnyOf1();

  /// Converts a `Map<String, dynamic>` to an [InteractionsGetRestrictionsForAuthenticatedUser200ResponseAnyOf1].
  factory InteractionsGetRestrictionsForAuthenticatedUser200ResponseAnyOf1.fromJson(
    Map<String, dynamic> _,
  ) {
    return const InteractionsGetRestrictionsForAuthenticatedUser200ResponseAnyOf1();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InteractionsGetRestrictionsForAuthenticatedUser200ResponseAnyOf1?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InteractionsGetRestrictionsForAuthenticatedUser200ResponseAnyOf1.fromJson(
      json,
    );
  }

  Map<String, dynamic> toJson() => const {};
}
