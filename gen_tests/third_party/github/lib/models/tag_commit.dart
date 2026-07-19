import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class TagCommit {
  const TagCommit({required this.sha, required this.url});

  /// Converts a `Map<String, dynamic>` to a [TagCommit].
  factory TagCommit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'TagCommit',
      json,
      () => TagCommit(
        sha: json['sha'] as String,
        url: Uri.parse(json['url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static TagCommit? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return TagCommit.fromJson(json);
  }

  final String sha;
  final Uri url;

  /// Converts a [TagCommit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'sha': sha, 'url': url.toString()};
  }

  @override
  int get hashCode => Object.hashAll([sha, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TagCommit && sha == other.sha && url == other.url;
  }
}
