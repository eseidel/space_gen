import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class FileCommitCommitVerification {
  const FileCommitCommitVerification({
    this.verified,
    this.reason,
    this.signature,
    this.payload,
    this.verifiedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [FileCommitCommitVerification].
  factory FileCommitCommitVerification.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FileCommitCommitVerification',
      json,
      () => FileCommitCommitVerification(
        verified: json['verified'] as bool?,
        reason: json['reason'] as String?,
        signature: json['signature'] as String?,
        payload: json['payload'] as String?,
        verifiedAt: json['verified_at'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FileCommitCommitVerification? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return FileCommitCommitVerification.fromJson(json);
  }

  final bool? verified;
  final String? reason;
  final String? signature;
  final String? payload;
  final String? verifiedAt;

  /// Converts a [FileCommitCommitVerification] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (verified != null) 'verified': verified,
      if (reason != null) 'reason': reason,
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
    return other is FileCommitCommitVerification &&
        verified == other.verified &&
        reason == other.reason &&
        signature == other.signature &&
        payload == other.payload &&
        verifiedAt == other.verifiedAt;
  }
}
