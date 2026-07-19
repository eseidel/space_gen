import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template key_simple}
/// Key Simple
/// Key Simple
/// {@endtemplate}
@immutable
class KeySimple {
  /// {@macro key_simple}
  const KeySimple({required this.id, required this.key});

  /// Converts a `Map<String, dynamic>` to a [KeySimple].
  factory KeySimple.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'KeySimple',
      json,
      () => KeySimple(id: json['id'] as int, key: json['key'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static KeySimple? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return KeySimple.fromJson(json);
  }

  final int id;
  final String key;

  /// Converts a [KeySimple] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id, 'key': key};
  }

  @override
  int get hashCode => Object.hashAll([id, key]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is KeySimple && id == other.id && key == other.key;
  }
}
