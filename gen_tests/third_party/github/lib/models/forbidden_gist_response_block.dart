import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ForbiddenGistResponseBlock {
  const ForbiddenGistResponseBlock({this.reason, this.createdAt, this.htmlUrl});

  /// Converts a `Map<String, dynamic>` to a [ForbiddenGistResponseBlock].
  factory ForbiddenGistResponseBlock.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ForbiddenGistResponseBlock',
      json,
      () => ForbiddenGistResponseBlock(
        reason: json['reason'] as String?,
        createdAt: json['created_at'] as String?,
        htmlUrl: json['html_url'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ForbiddenGistResponseBlock? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ForbiddenGistResponseBlock.fromJson(json);
  }

  final String? reason;
  final String? createdAt;
  final String? htmlUrl;

  /// Converts a [ForbiddenGistResponseBlock] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'reason': ?reason, 'created_at': ?createdAt, 'html_url': htmlUrl};
  }

  @override
  int get hashCode => Object.hashAll([reason, createdAt, htmlUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ForbiddenGistResponseBlock &&
        reason == other.reason &&
        createdAt == other.createdAt &&
        htmlUrl == other.htmlUrl;
  }
}
