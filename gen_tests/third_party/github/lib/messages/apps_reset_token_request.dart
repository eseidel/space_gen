import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class AppsResetTokenRequest {
  const AppsResetTokenRequest({required this.accessToken});

  /// Converts a `Map<String, dynamic>` to an [AppsResetTokenRequest].
  factory AppsResetTokenRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AppsResetTokenRequest',
      json,
      () => AppsResetTokenRequest(accessToken: json['access_token'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AppsResetTokenRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AppsResetTokenRequest.fromJson(json);
  }

  /// The access_token of the OAuth or GitHub application.
  final String accessToken;

  /// Converts an [AppsResetTokenRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'access_token': accessToken};
  }

  @override
  int get hashCode => accessToken.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppsResetTokenRequest && accessToken == other.accessToken;
  }
}
