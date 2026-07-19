import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template short_blob}
/// Short Blob
/// Short Blob
/// {@endtemplate}
@immutable
class ShortBlob {
  /// {@macro short_blob}
  const ShortBlob({required this.url, required this.sha});

  /// Converts a `Map<String, dynamic>` to a [ShortBlob].
  factory ShortBlob.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShortBlob',
      json,
      () => ShortBlob(url: json['url'] as String, sha: json['sha'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShortBlob? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShortBlob.fromJson(json);
  }

  final String url;
  final String sha;

  /// Converts a [ShortBlob] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'url': url, 'sha': sha};
  }

  @override
  int get hashCode => Object.hashAll([url, sha]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShortBlob && url == other.url && sha == other.sha;
  }
}
