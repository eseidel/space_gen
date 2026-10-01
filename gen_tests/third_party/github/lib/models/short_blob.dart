// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
