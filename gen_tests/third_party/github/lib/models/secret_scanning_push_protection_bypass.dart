import 'package:github/model_helpers.dart';
import 'package:github/models/secret_scanning_push_protection_bypass_reason.dart';
import 'package:meta/meta.dart';

@immutable
class SecretScanningPushProtectionBypass {
  const SecretScanningPushProtectionBypass({
    this.reason,
    this.expireAt,
    this.tokenType,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [SecretScanningPushProtectionBypass].
  factory SecretScanningPushProtectionBypass.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecretScanningPushProtectionBypass',
      json,
      () => SecretScanningPushProtectionBypass(
        reason: SecretScanningPushProtectionBypassReason.maybeFromJson(
          json['reason'] as String?,
        ),
        expireAt: maybeParseDateTime(json['expire_at'] as String?),
        tokenType: json['token_type'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningPushProtectionBypass? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningPushProtectionBypass.fromJson(json);
  }

  /// The reason for bypassing push protection.
  final SecretScanningPushProtectionBypassReason? reason;

  /// The time that the bypass will expire in ISO 8601 format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? expireAt;

  /// The token type this bypass is for.
  final String? tokenType;

  /// Converts a [SecretScanningPushProtectionBypass]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (reason != null) 'reason': reason?.toJson(),
      'expire_at': expireAt?.toIso8601String(),
      if (tokenType != null) 'token_type': tokenType,
    };
  }

  @override
  int get hashCode => Object.hashAll([reason, expireAt, tokenType]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningPushProtectionBypass &&
        reason == other.reason &&
        expireAt == other.expireAt &&
        tokenType == other.tokenType;
  }
}
