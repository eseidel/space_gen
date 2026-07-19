import 'package:discord/model_helpers.dart';
import 'package:discord/models/application_identity_provider_auth_type.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class PartnerSdkUnmergeProvisionalAccountRequest {
  const PartnerSdkUnmergeProvisionalAccountRequest({
    required this.clientId,
    required this.externalAuthToken,
    required this.externalAuthType,
    this.clientSecret,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [PartnerSdkUnmergeProvisionalAccountRequest].
  factory PartnerSdkUnmergeProvisionalAccountRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'PartnerSdkUnmergeProvisionalAccountRequest',
      json,
      () => PartnerSdkUnmergeProvisionalAccountRequest(
        clientId: SnowflakeType.fromJson(json['client_id'] as String),
        clientSecret: json['client_secret'] as String?,
        externalAuthToken: json['external_auth_token'] as String,
        externalAuthType: ApplicationIdentityProviderAuthType.fromJson(
          json['external_auth_type'] as String,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PartnerSdkUnmergeProvisionalAccountRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return PartnerSdkUnmergeProvisionalAccountRequest.fromJson(json);
  }

  final SnowflakeType clientId;
  final String? clientSecret;
  final String externalAuthToken;
  final ApplicationIdentityProviderAuthType externalAuthType;

  /// Converts a [PartnerSdkUnmergeProvisionalAccountRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'client_id': clientId.toJson(),
      'client_secret': clientSecret,
      'external_auth_token': externalAuthToken,
      'external_auth_type': externalAuthType.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    clientId,
    clientSecret,
    externalAuthToken,
    externalAuthType,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PartnerSdkUnmergeProvisionalAccountRequest &&
        clientId == other.clientId &&
        clientSecret == other.clientSecret &&
        externalAuthToken == other.externalAuthToken &&
        externalAuthType == other.externalAuthType;
  }
}
