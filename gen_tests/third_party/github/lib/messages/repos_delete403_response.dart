import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposDelete403Response {
  const ReposDelete403Response({this.message, this.documentationUrl});

  /// Converts a `Map<String, dynamic>` to a [ReposDelete403Response].
  factory ReposDelete403Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposDelete403Response',
      json,
      () => ReposDelete403Response(
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposDelete403Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposDelete403Response.fromJson(json);
  }

  final String? message;
  final String? documentationUrl;

  /// Converts a [ReposDelete403Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'message': message, 'documentation_url': documentationUrl};
  }

  @override
  int get hashCode => Object.hashAll([message, documentationUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposDelete403Response &&
        message == other.message &&
        documentationUrl == other.documentationUrl;
  }
}
