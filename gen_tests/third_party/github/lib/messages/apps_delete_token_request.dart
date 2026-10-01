// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class AppsDeleteTokenRequest {
  const AppsDeleteTokenRequest({required this.accessToken});

  /// Converts a `Map<String, dynamic>` to an [AppsDeleteTokenRequest].
  factory AppsDeleteTokenRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AppsDeleteTokenRequest',
      json,
      () => AppsDeleteTokenRequest(accessToken: json['access_token'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AppsDeleteTokenRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AppsDeleteTokenRequest.fromJson(json);
  }

  /// The OAuth access token used to authenticate to the GitHub API.
  final String accessToken;

  /// Converts an [AppsDeleteTokenRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'access_token': accessToken};
  }

  @override
  int get hashCode => accessToken.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppsDeleteTokenRequest && accessToken == other.accessToken;
  }
}
