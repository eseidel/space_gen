import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class AppsCheckTokenRequest {
  const AppsCheckTokenRequest({required this.accessToken});

  /// Converts a `Map<String, dynamic>` to an [AppsCheckTokenRequest].
  factory AppsCheckTokenRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AppsCheckTokenRequest',
      json,
      () => AppsCheckTokenRequest(accessToken: json['access_token'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AppsCheckTokenRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AppsCheckTokenRequest.fromJson(json);
  }

  /// The access_token of the OAuth or GitHub application.
  final String accessToken;

  /// Converts an [AppsCheckTokenRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'access_token': accessToken};
  }

  @override
  int get hashCode => accessToken.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppsCheckTokenRequest && accessToken == other.accessToken;
  }
}
