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
      if (code != null) 'code': code,
      if (message != null) 'message': message,
      if (documentationUrl != null) 'documentation_url': documentationUrl,
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
