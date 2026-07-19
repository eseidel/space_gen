import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template basic_error}
/// Basic Error
/// Basic Error
/// {@endtemplate}
@immutable
class BasicError {
  /// {@macro basic_error}
  const BasicError({
    this.message,
    this.documentationUrl,
    this.url,
    this.status,
  });

  /// Converts a `Map<String, dynamic>` to a [BasicError].
  factory BasicError.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BasicError',
      json,
      () => BasicError(
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
        url: json['url'] as String?,
        status: json['status'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BasicError? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BasicError.fromJson(json);
  }

  final String? message;
  final String? documentationUrl;
  final String? url;
  final String? status;

  /// Converts a [BasicError] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'documentation_url': documentationUrl,
      'url': url,
      'status': status,
    };
  }

  @override
  int get hashCode => Object.hashAll([message, documentationUrl, url, status]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BasicError &&
        message == other.message &&
        documentationUrl == other.documentationUrl &&
        url == other.url &&
        status == other.status;
  }
}
