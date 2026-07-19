import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template blob}
/// Blob
/// Blob
/// {@endtemplate}
@immutable
class Blob {
  /// {@macro blob}
  const Blob({
    required this.content,
    required this.encoding,
    required this.url,
    required this.sha,
    required this.size,
    required this.nodeId,
    this.highlightedContent,
  });

  /// Converts a `Map<String, dynamic>` to a [Blob].
  factory Blob.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Blob',
      json,
      () => Blob(
        content: json['content'] as String,
        encoding: json['encoding'] as String,
        url: Uri.parse(json['url'] as String),
        sha: json['sha'] as String,
        size: checkedKey(json, 'size') as int?,
        nodeId: json['node_id'] as String,
        highlightedContent: json['highlighted_content'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Blob? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Blob.fromJson(json);
  }

  final String content;
  final String encoding;
  final Uri url;
  final String sha;
  final int? size;
  final String nodeId;
  final String? highlightedContent;

  /// Converts a [Blob] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'encoding': encoding,
      'url': url.toString(),
      'sha': sha,
      'size': size,
      'node_id': nodeId,
      'highlighted_content': ?highlightedContent,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    content,
    encoding,
    url,
    sha,
    size,
    nodeId,
    highlightedContent,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Blob &&
        content == other.content &&
        encoding == other.encoding &&
        url == other.url &&
        sha == other.sha &&
        size == other.size &&
        nodeId == other.nodeId &&
        highlightedContent == other.highlightedContent;
  }
}
