import 'package:github/model_helpers.dart';
import 'package:github/models/repos_create_pages_site_request_build_type.dart';
import 'package:github/models/repos_create_pages_site_request_source.dart';
import 'package:meta/meta.dart';

/// {@template repos_create_pages_site_request}
/// The source branch and directory used to publish your Pages site.
/// {@endtemplate}
@immutable
class ReposCreatePagesSiteRequest {
  /// {@macro repos_create_pages_site_request}
  const ReposCreatePagesSiteRequest({this.buildType, this.source});

  /// Converts a `Map<String, dynamic>` to a [ReposCreatePagesSiteRequest].
  factory ReposCreatePagesSiteRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposCreatePagesSiteRequest',
      json,
      () => ReposCreatePagesSiteRequest(
        buildType: ReposCreatePagesSiteRequestBuildType.maybeFromJson(
          json['build_type'] as String?,
        ),
        source: ReposCreatePagesSiteRequestSource.maybeFromJson(
          json['source'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreatePagesSiteRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreatePagesSiteRequest.fromJson(json);
  }

  /// The process in which the Page will be built. Possible values are
  /// `"legacy"` and `"workflow"`.
  final ReposCreatePagesSiteRequestBuildType? buildType;

  /// The source branch and directory used to publish your Pages site.
  final ReposCreatePagesSiteRequestSource? source;

  /// Converts a [ReposCreatePagesSiteRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (buildType != null) 'build_type': buildType?.toJson(),
      if (source != null) 'source': source?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([buildType, source]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreatePagesSiteRequest &&
        buildType == other.buildType &&
        source == other.source;
  }
}
