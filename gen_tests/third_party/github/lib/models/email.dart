import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template email}
/// Email
/// Email
/// {@endtemplate}
@immutable
class Email {
  /// {@macro email}
  const Email({
    required this.email,
    required this.primary,
    required this.verified,
    required this.visibility,
  });

  /// Converts a `Map<String, dynamic>` to an [Email].
  factory Email.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Email',
      json,
      () => Email(
        email: json['email'] as String,
        primary: json['primary'] as bool,
        verified: json['verified'] as bool,
        visibility: checkedKey(json, 'visibility') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Email? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Email.fromJson(json);
  }

  /// Example: `'octocat@github.com'`
  final String email;

  /// Example: `true`
  final bool primary;

  /// Example: `true`
  final bool verified;

  /// Example: `'public'`
  final String? visibility;

  /// Converts an [Email] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'primary': primary,
      'verified': verified,
      'visibility': visibility,
    };
  }

  @override
  int get hashCode => Object.hashAll([email, primary, verified, visibility]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Email &&
        email == other.email &&
        primary == other.primary &&
        verified == other.verified &&
        visibility == other.visibility;
  }
}
