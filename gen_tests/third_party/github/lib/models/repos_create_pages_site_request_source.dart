import 'package:github/model_helpers.dart';
import 'package:github/models/repos_create_pages_site_request_source_path.dart';
import 'package:meta/meta.dart';

/// {@template repos_create_pages_site_request_source}
/// The source branch and directory used to publish your Pages site.
/// {@endtemplate}
@immutable
class ReposCreatePagesSiteRequestSource {
  /// {@macro repos_create_pages_site_request_source}
  const ReposCreatePagesSiteRequestSource({
    required this.branch,
    this.path = ReposCreatePagesSiteRequestSourcePath.a,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposCreatePagesSiteRequestSource].
  factory ReposCreatePagesSiteRequestSource.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposCreatePagesSiteRequestSource',
      json,
      () => ReposCreatePagesSiteRequestSource(
        branch: json['branch'] as String,
        path:
            ReposCreatePagesSiteRequestSourcePath.maybeFromJson(
              json['path'] as String?,
            ) ??
            ReposCreatePagesSiteRequestSourcePath.a,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreatePagesSiteRequestSource? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreatePagesSiteRequestSource.fromJson(json);
  }

  /// The repository branch used to publish your site's source files.
  final String branch;

  /// The repository directory that includes the source files for the Pages
  /// site. Allowed paths are `/` or `/docs`. Default: `/`
  final ReposCreatePagesSiteRequestSourcePath path;

  /// Converts a [ReposCreatePagesSiteRequestSource]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'branch': branch, 'path': path.toJson()};
  }

  @override
  int get hashCode => Object.hashAll([branch, path]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreatePagesSiteRequestSource &&
        branch == other.branch &&
        path == other.path;
  }
}
