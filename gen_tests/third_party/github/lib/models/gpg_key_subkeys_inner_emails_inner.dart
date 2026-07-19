import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GpgKeySubkeysInnerEmailsInner {
  const GpgKeySubkeysInnerEmailsInner({this.email, this.verified});

  /// Converts a `Map<String, dynamic>` to a [GpgKeySubkeysInnerEmailsInner].
  factory GpgKeySubkeysInnerEmailsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GpgKeySubkeysInnerEmailsInner',
      json,
      () => GpgKeySubkeysInnerEmailsInner(
        email: json['email'] as String?,
        verified: json['verified'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GpgKeySubkeysInnerEmailsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GpgKeySubkeysInnerEmailsInner.fromJson(json);
  }

  final String? email;
  final bool? verified;

  /// Converts a [GpgKeySubkeysInnerEmailsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (email != null) 'email': email,
      if (verified != null) 'verified': verified,
    };
  }

  @override
  int get hashCode => Object.hashAll([email, verified]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GpgKeySubkeysInnerEmailsInner &&
        email == other.email &&
        verified == other.verified;
  }
}
