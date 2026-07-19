import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class HovercardContextsInner {
  const HovercardContextsInner({required this.message, required this.octicon});

  /// Converts a `Map<String, dynamic>` to a [HovercardContextsInner].
  factory HovercardContextsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'HovercardContextsInner',
      json,
      () => HovercardContextsInner(
        message: json['message'] as String,
        octicon: json['octicon'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static HovercardContextsInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return HovercardContextsInner.fromJson(json);
  }

  final String message;
  final String octicon;

  /// Converts a [HovercardContextsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'message': message, 'octicon': octicon};
  }

  @override
  int get hashCode => Object.hashAll([message, octicon]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HovercardContextsInner &&
        message == other.message &&
        octicon == other.octicon;
  }
}
