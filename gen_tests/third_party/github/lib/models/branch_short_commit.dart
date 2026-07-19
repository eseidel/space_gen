import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BranchShortCommit {
  const BranchShortCommit({required this.sha, required this.url});

  /// Converts a `Map<String, dynamic>` to a [BranchShortCommit].
  factory BranchShortCommit.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BranchShortCommit',
      json,
      () => BranchShortCommit(
        sha: json['sha'] as String,
        url: json['url'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchShortCommit? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BranchShortCommit.fromJson(json);
  }

  final String sha;
  final String url;

  /// Converts a [BranchShortCommit] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'sha': sha, 'url': url};
  }

  @override
  int get hashCode => Object.hashAll([sha, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchShortCommit && sha == other.sha && url == other.url;
  }
}
