// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GitCommitVerification {
  const GitCommitVerification({
    required this.verified,
    required this.reason,
    required this.signature,
    required this.payload,
    required this.verifiedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [GitCommitVerification].
  factory GitCommitVerification.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GitCommitVerification',
      json,
      () => GitCommitVerification(
        verified: json['verified'] as bool,
        reason: json['reason'] as String,
        signature: checkedKey(json, 'signature') as String?,
        payload: checkedKey(json, 'payload') as String?,
        verifiedAt: checkedKey(json, 'verified_at') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GitCommitVerification? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GitCommitVerification.fromJson(json);
  }

  final bool verified;
  final String reason;
  final String? signature;
  final String? payload;
  final String? verifiedAt;

  /// Converts a [GitCommitVerification] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'verified': verified,
      'reason': reason,
      'signature': signature,
      'payload': payload,
      'verified_at': verifiedAt,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([verified, reason, signature, payload, verifiedAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GitCommitVerification &&
        verified == other.verified &&
        reason == other.reason &&
        signature == other.signature &&
        payload == other.payload &&
        verifiedAt == other.verifiedAt;
  }
}
