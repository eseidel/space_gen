import 'package:github/model_helpers.dart';
import 'package:github/models/secret_scanning_push_protection_bypass_placeholder_id.dart';
import 'package:github/models/secret_scanning_push_protection_bypass_reason.dart';
import 'package:meta/meta.dart';

@immutable
class SecretScanningCreatePushProtectionBypassRequest {
  const SecretScanningCreatePushProtectionBypassRequest({
    required this.reason,
    required this.placeholderId,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [SecretScanningCreatePushProtectionBypassRequest].
  factory SecretScanningCreatePushProtectionBypassRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SecretScanningCreatePushProtectionBypassRequest',
      json,
      () => SecretScanningCreatePushProtectionBypassRequest(
        reason: SecretScanningPushProtectionBypassReason.fromJson(
          json['reason'] as String,
        ),
        placeholderId: SecretScanningPushProtectionBypassPlaceholderId.fromJson(
          json['placeholder_id'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningCreatePushProtectionBypassRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SecretScanningCreatePushProtectionBypassRequest.fromJson(json);
  }

  /// The reason for bypassing push protection.
  final SecretScanningPushProtectionBypassReason reason;

  /// The ID of the push protection bypass placeholder. This value is returned
  /// on any push protected routes.
  final SecretScanningPushProtectionBypassPlaceholderId placeholderId;

  /// Converts a [SecretScanningCreatePushProtectionBypassRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'reason': reason.toJson(),
      'placeholder_id': placeholderId.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([reason, placeholderId]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningCreatePushProtectionBypassRequest &&
        reason == other.reason &&
        placeholderId == other.placeholderId;
  }
}
