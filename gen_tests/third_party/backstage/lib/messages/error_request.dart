import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ErrorRequest {
  const ErrorRequest({required this.method, required this.url});

  /// Converts a `Map<String, dynamic>` to an [ErrorRequest].
  factory ErrorRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ErrorRequest',
      json,
      () => ErrorRequest(
        method: json['method'] as String,
        url: json['url'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ErrorRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ErrorRequest.fromJson(json);
  }

  final String method;
  final String url;

  /// Converts an [ErrorRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'method': method, 'url': url};
  }

  @override
  int get hashCode => Object.hashAll([method, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ErrorRequest && method == other.method && url == other.url;
  }
}
