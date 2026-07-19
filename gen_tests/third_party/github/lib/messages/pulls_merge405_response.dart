import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class PullsMerge405Response {
  const PullsMerge405Response({this.message, this.documentationUrl});

  /// Converts a `Map<String, dynamic>` to a [PullsMerge405Response].
  factory PullsMerge405Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PullsMerge405Response',
      json,
      () => PullsMerge405Response(
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PullsMerge405Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PullsMerge405Response.fromJson(json);
  }

  final String? message;
  final String? documentationUrl;

  /// Converts a [PullsMerge405Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'message': message, 'documentation_url': documentationUrl};
  }

  @override
  int get hashCode => Object.hashAll([message, documentationUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PullsMerge405Response &&
        message == other.message &&
        documentationUrl == other.documentationUrl;
  }
}
