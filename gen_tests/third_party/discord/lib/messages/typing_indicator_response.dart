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
