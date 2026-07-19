import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template pages_source_hash}
/// Pages Source Hash
/// {@endtemplate}
@immutable
class PagesSourceHash {
  /// {@macro pages_source_hash}
  const PagesSourceHash({required this.branch, required this.path});

  /// Converts a `Map<String, dynamic>` to a [PagesSourceHash].
  factory PagesSourceHash.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PagesSourceHash',
      json,
      () => PagesSourceHash(
        branch: json['branch'] as String,
        path: json['path'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PagesSourceHash? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PagesSourceHash.fromJson(json);
  }

  final String branch;
  final String path;

  /// Converts a [PagesSourceHash] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'branch': branch, 'path': path};
  }

  @override
  int get hashCode => Object.hashAll([branch, path]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PagesSourceHash &&
        branch == other.branch &&
        path == other.path;
  }
}
