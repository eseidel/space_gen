import 'package:github/model_helpers.dart';
import 'package:github/models/forbidden_gist_response_block.dart';
import 'package:meta/meta.dart';

@immutable
class ForbiddenGistResponse {
  const ForbiddenGistResponse({
    this.block,
    this.message,
    this.documentationUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [ForbiddenGistResponse].
  factory ForbiddenGistResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ForbiddenGistResponse',
      json,
      () => ForbiddenGistResponse(
        block: ForbiddenGistResponseBlock.maybeFromJson(
          json['block'] as Map<String, dynamic>?,
        ),
        message: json['message'] as String?,
        documentationUrl: json['documentation_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ForbiddenGistResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ForbiddenGistResponse.fromJson(json);
  }

  final ForbiddenGistResponseBlock? block;
  final String? message;
  final String? documentationUrl;

  /// Converts a [ForbiddenGistResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'block': block?.toJson(),
      'message': message,
      'documentation_url': documentationUrl,
    };
  }

  @override
  int get hashCode => Object.hashAll([block, message, documentationUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ForbiddenGistResponse &&
        block == other.block &&
        message == other.message &&
        documentationUrl == other.documentationUrl;
  }
}
