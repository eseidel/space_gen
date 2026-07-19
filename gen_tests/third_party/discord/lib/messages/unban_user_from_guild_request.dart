import 'package:meta/meta.dart';

@immutable
class UnbanUserFromGuildRequest {
  const UnbanUserFromGuildRequest();

  /// Converts a `Map<String, dynamic>` to a [UnbanUserFromGuildRequest].
  factory UnbanUserFromGuildRequest.fromJson(Map<String, dynamic> _) {
    return const UnbanUserFromGuildRequest();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static UnbanUserFromGuildRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return UnbanUserFromGuildRequest.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
