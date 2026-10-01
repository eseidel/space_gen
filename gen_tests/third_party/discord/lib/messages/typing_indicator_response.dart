// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';

@immutable
class TypingIndicatorResponse {
  const TypingIndicatorResponse();

  /// Converts a `Map<String, dynamic>` to a [TypingIndicatorResponse].
  factory TypingIndicatorResponse.fromJson(Map<String, dynamic> _) {
    return const TypingIndicatorResponse();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TypingIndicatorResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TypingIndicatorResponse.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
