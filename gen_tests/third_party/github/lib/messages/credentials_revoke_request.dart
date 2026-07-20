import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CredentialsRevokeRequest {
  CredentialsRevokeRequest({required this.credentials}) {
    credentials.validate(minItems: 1, maxItems: 1000);
  }

  /// Converts a `Map<String, dynamic>` to a [CredentialsRevokeRequest].
  factory CredentialsRevokeRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CredentialsRevokeRequest',
      json,
      () => CredentialsRevokeRequest(
        credentials: (json['credentials'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CredentialsRevokeRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CredentialsRevokeRequest.fromJson(json);
  }

  /// A list of credentials to be revoked, up to 1000 per request.
  final List<String> credentials;

  /// Converts a [CredentialsRevokeRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'credentials': credentials};
  }

  @override
  int get hashCode => listHash(credentials).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CredentialsRevokeRequest &&
        listsEqual(credentials, other.credentials);
  }
}
