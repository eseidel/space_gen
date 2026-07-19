import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template verification}
/// Verification
/// {@endtemplate}
@immutable
class Verification {
  /// {@macro verification}
  const Verification({
    required this.verified,
    required this.reason,
    required this.payload,
    required this.signature,
    required this.verifiedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [Verification].
  factory Verification.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Verification',
      json,
      () => Verification(
        verified: json['verified'] as bool,
        reason: json['reason'] as String,
        payload: checkedKey(json, 'payload') as String?,
        signature: checkedKey(json, 'signature') as String?,
        verifiedAt: checkedKey(json, 'verified_at') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Verification? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Verification.fromJson(json);
  }

  final bool verified;
  final String reason;
  final String? payload;
  final String? signature;
  final String? verifiedAt;

  /// Converts a [Verification] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'verified': verified,
      'reason': reason,
      'payload': payload,
      'signature': signature,
      'verified_at': verifiedAt,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([verified, reason, payload, signature, verifiedAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Verification &&
        verified == other.verified &&
        reason == other.reason &&
        payload == other.payload &&
        signature == other.signature &&
        verifiedAt == other.verifiedAt;
  }
}
