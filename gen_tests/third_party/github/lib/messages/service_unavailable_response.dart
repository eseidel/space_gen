// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ServiceUnavailableResponse {
  const ServiceUnavailableResponse({
    this.code,
    this.message,
    this.documentationUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [ServiceUnavailableResponse].
  factory ServiceUnavailableResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ServiceUnavailableResponse',
      json,
      () => ServiceUnavailableResponse(
        code: json['code'] as String?,
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ServiceUnavailableResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ServiceUnavailableResponse.fromJson(json);
  }

  final String? code;
  final String? message;
  final String? documentationUrl;

  /// Converts a [ServiceUnavailableResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'code': ?code,
      'message': ?message,
      'documentation_url': ?documentationUrl,
    };
  }

  @override
  int get hashCode => Object.hashAll([code, message, documentationUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ServiceUnavailableResponse &&
        code == other.code &&
        message == other.message &&
        documentationUrl == other.documentationUrl;
  }
}
