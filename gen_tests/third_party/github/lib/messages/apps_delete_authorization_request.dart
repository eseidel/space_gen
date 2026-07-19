import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class AppsDeleteAuthorizationRequest {
  const AppsDeleteAuthorizationRequest({required this.accessToken});

  /// Converts a `Map<String, dynamic>` to an [AppsDeleteAuthorizationRequest].
  factory AppsDeleteAuthorizationRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AppsDeleteAuthorizationRequest',
      json,
      () => AppsDeleteAuthorizationRequest(
        accessToken: json['access_token'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AppsDeleteAuthorizationRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return AppsDeleteAuthorizationRequest.fromJson(json);
  }

  /// The OAuth access token used to authenticate to the GitHub API.
  final String accessToken;

  /// Converts an [AppsDeleteAuthorizationRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'access_token': accessToken};
  }

  @override
  int get hashCode => accessToken.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppsDeleteAuthorizationRequest &&
        accessToken == other.accessToken;
  }
}
