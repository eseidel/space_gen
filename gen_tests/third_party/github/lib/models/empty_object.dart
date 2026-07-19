import 'package:meta/meta.dart';

/// Empty Object
/// An object without any properties.
@immutable
class EmptyObject {
  const EmptyObject();

  /// Converts a `Map<String, dynamic>` to an [EmptyObject].
  factory EmptyObject.fromJson(Map<String, dynamic> _) {
    return const EmptyObject();
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EmptyObject? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EmptyObject.fromJson(json);
  }

  Map<String, dynamic> toJson() => const {};
}
