import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GpgKeyEmailsInner {
  const GpgKeyEmailsInner({this.email, this.verified});

  /// Converts a `Map<String, dynamic>` to a [GpgKeyEmailsInner].
  factory GpgKeyEmailsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GpgKeyEmailsInner',
      json,
      () => GpgKeyEmailsInner(
        email: json['email'] as String?,
        verified: json['verified'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GpgKeyEmailsInner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GpgKeyEmailsInner.fromJson(json);
  }

  final String? email;
  final bool? verified;

  /// Converts a [GpgKeyEmailsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'email': ?email, 'verified': ?verified};
  }

  @override
  int get hashCode => Object.hashAll([email, verified]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GpgKeyEmailsInner &&
        email == other.email &&
        verified == other.verified;
  }
}
