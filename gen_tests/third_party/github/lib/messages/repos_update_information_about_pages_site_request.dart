// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/repos_update_information_about_pages_site_request_build_type.dart';
import 'package:github/models/repos_update_information_about_pages_site_request_source.dart';
import 'package:meta/meta.dart';

@immutable
class ReposUpdateInformationAboutPagesSiteRequest {
  const ReposUpdateInformationAboutPagesSiteRequest({
    this.cname,
    this.httpsEnforced,
    this.buildType,
    this.source,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposUpdateInformationAboutPagesSiteRequest].
  factory ReposUpdateInformationAboutPagesSiteRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposUpdateInformationAboutPagesSiteRequest',
      json,
      () => ReposUpdateInformationAboutPagesSiteRequest(
        cname: json['cname'] as String?,
        httpsEnforced: json['https_enforced'] as bool?,
        buildType:
            ReposUpdateInformationAboutPagesSiteRequestBuildType.maybeFromJson(
              json['build_type'] as String?,
            ),
        source: ReposUpdateInformationAboutPagesSiteRequestSource.maybeFromJson(
          json['source'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposUpdateInformationAboutPagesSiteRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateInformationAboutPagesSiteRequest.fromJson(json);
  }

  /// Specify a custom domain for the repository. Sending a `null` value will
  /// remove the custom domain. For more about custom domains, see "[Using a
  /// custom domain with GitHub
  /// Pages](https://docs.github.com/pages/configuring-a-custom-domain-for-your-github-pages-site)."
  final String? cname;

  /// Specify whether HTTPS should be enforced for the repository.
  final bool? httpsEnforced;

  /// The process by which the GitHub Pages site will be built. `workflow`
  /// means that the site is built by a custom GitHub Actions workflow.
  /// `legacy` means that the site is built by GitHub when changes are pushed
  /// to a specific branch.
  final ReposUpdateInformationAboutPagesSiteRequestBuildType? buildType;
  final ReposUpdateInformationAboutPagesSiteRequestSource? source;

  /// Converts a [ReposUpdateInformationAboutPagesSiteRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'cname': cname,
      'https_enforced': httpsEnforced,
      'build_type': buildType?.toJson(),
      'source': source?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([cname, httpsEnforced, buildType, source]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposUpdateInformationAboutPagesSiteRequest &&
        cname == other.cname &&
        httpsEnforced == other.httpsEnforced &&
        buildType == other.buildType &&
        source == other.source;
  }
}
