import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BotPartnerSdkTokenRequest {
  const BotPartnerSdkTokenRequest({
    required this.externalUserId,
    this.preferredGlobalName,
  });

  /// Converts a `Map<String, dynamic>` to a [BotPartnerSdkTokenRequest].
  factory BotPartnerSdkTokenRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BotPartnerSdkTokenRequest',
      json,
      () => BotPartnerSdkTokenRequest(
        externalUserId: json['external_user_id'] as String,
        preferredGlobalName: json['preferred_global_name'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BotPartnerSdkTokenRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BotPartnerSdkTokenRequest.fromJson(json);
  }

  final String externalUserId;
  final String? preferredGlobalName;

  /// Converts a [BotPartnerSdkTokenRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'external_user_id': externalUserId,
      'preferred_global_name': preferredGlobalName,
    };
  }

  @override
  int get hashCode => Object.hashAll([externalUserId, preferredGlobalName]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BotPartnerSdkTokenRequest &&
        externalUserId == other.externalUserId &&
        preferredGlobalName == other.preferredGlobalName;
  }
}
