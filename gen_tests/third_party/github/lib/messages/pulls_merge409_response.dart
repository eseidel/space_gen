import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullsMerge409Response {
  const PullsMerge409Response({this.message, this.documentationUrl});

  /// Converts a `Map<String, dynamic>` to a [PullsMerge409Response].
  factory PullsMerge409Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullsMerge409Response',
      json,
      () => PullsMerge409Response(
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsMerge409Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullsMerge409Response.fromJson(json);
  }

  final String? message;
  final String? documentationUrl;

  /// Converts a [PullsMerge409Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (message != null) 'message': message,
      if (documentationUrl != null) 'documentation_url': documentationUrl,
    };
  }

  @override
  int get hashCode => Object.hashAll([message, documentationUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsMerge409Response &&
        message == other.message &&
        documentationUrl == other.documentationUrl;
  }
}
