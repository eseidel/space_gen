import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class FileCommitContentLinks {
  const FileCommitContentLinks({this.self, this.git, this.html});

  /// Converts a `Map<String, dynamic>` to a [FileCommitContentLinks].
  factory FileCommitContentLinks.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FileCommitContentLinks',
      json,
      () => FileCommitContentLinks(
        self: json['self'] as String?,
        git: json['git'] as String?,
        html: json['html'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FileCommitContentLinks? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FileCommitContentLinks.fromJson(json);
  }

  final String? self;
  final String? git;
  final String? html;

  /// Converts a [FileCommitContentLinks] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'self': ?self, 'git': ?git, 'html': ?html};
  }

  @override
  int get hashCode => Object.hashAll([self, git, html]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FileCommitContentLinks &&
        self == other.self &&
        git == other.git &&
        html == other.html;
  }
}
