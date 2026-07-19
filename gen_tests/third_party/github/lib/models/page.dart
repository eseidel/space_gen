import 'package:github/model_helpers.dart';
import 'package:github/models/page_build_type.dart';
import 'package:github/models/page_protected_domain_state.dart';
import 'package:github/models/page_status.dart';
import 'package:github/models/pages_https_certificate.dart';
import 'package:github/models/pages_source_hash.dart';
import 'package:meta/meta.dart';

/// {@template page}
/// GitHub Pages
/// The configuration for GitHub Pages for a repository.
/// {@endtemplate}
@immutable
class Page {
  /// {@macro page}
  const Page({
    required this.url,
    required this.status,
    required this.cname,
    required this.public,
    this.protectedDomainState,
    this.pendingDomainUnverifiedAt,
    this.custom404 = false,
    this.htmlUrl,
    this.buildType,
    this.source,
    this.httpsCertificate,
    this.httpsEnforced,
  });

  /// Converts a `Map<String, dynamic>` to a [Page].
  factory Page.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Page',
      json,
      () => Page(
        url: Uri.parse(json['url'] as String),
        status: PageStatus.maybeFromJson(checkedKey(json, 'status') as String?),
        cname: checkedKey(json, 'cname') as String?,
        protectedDomainState: PageProtectedDomainState.maybeFromJson(
          json['protected_domain_state'] as String?,
        ),
        pendingDomainUnverifiedAt: maybeParseDateTime(
          json['pending_domain_unverified_at'] as String?,
        ),
        custom404: json['custom_404'] as bool,
        htmlUrl: maybeParseUri(json['html_url'] as String?),
        buildType: PageBuildType.maybeFromJson(json['build_type'] as String?),
        source: PagesSourceHash.maybeFromJson(
          json['source'] as Map<String, dynamic>?,
        ),
        public: json['public'] as bool,
        httpsCertificate: PagesHttpsCertificate.maybeFromJson(
          json['https_certificate'] as Map<String, dynamic>?,
        ),
        httpsEnforced: json['https_enforced'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Page? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Page.fromJson(json);
  }

  /// The API address for accessing this Page resource.
  /// Example: `'https://api.github.com/repos/github/hello-world/pages'`
  final Uri url;

  /// The status of the most recent build of the Page.
  /// Example: `'built'`
  final PageStatus? status;

  /// The Pages site's custom domain
  /// Example: `'example.com'`
  final String? cname;

  /// The state if the domain is verified
  /// Example: `'pending'`
  final PageProtectedDomainState? protectedDomainState;

  /// The timestamp when a pending domain becomes unverified.
  final DateTime? pendingDomainUnverifiedAt;

  /// Whether the Page has a custom 404 page.
  /// Example: `false`
  final bool custom404;

  /// The web address the Page can be accessed from.
  /// Example: `'https://example.com'`
  final Uri? htmlUrl;

  /// The process in which the Page will be built.
  /// Example: `'legacy'`
  final PageBuildType? buildType;

  /// Pages Source Hash
  final PagesSourceHash? source;

  /// Whether the GitHub Pages site is publicly visible. If set to `true`, the
  /// site is accessible to anyone on the internet. If set to `false`, the
  /// site will only be accessible to users who have at least `read` access to
  /// the repository that published the site.
  /// Example: `true`
  final bool public;

  /// Pages Https Certificate
  final PagesHttpsCertificate? httpsCertificate;

  /// Whether https is enabled on the domain
  /// Example: `true`
  final bool? httpsEnforced;

  /// Converts a [Page] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'status': status?.toJson(),
      'cname': cname,
      'protected_domain_state': protectedDomainState?.toJson(),
      'pending_domain_unverified_at': pendingDomainUnverifiedAt
          ?.toIso8601String(),
      'custom_404': custom404,
      if (htmlUrl != null) 'html_url': htmlUrl?.toString(),
      'build_type': buildType?.toJson(),
      if (source != null) 'source': source?.toJson(),
      'public': public,
      if (httpsCertificate != null)
        'https_certificate': httpsCertificate?.toJson(),
      if (httpsEnforced != null) 'https_enforced': httpsEnforced,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    status,
    cname,
    protectedDomainState,
    pendingDomainUnverifiedAt,
    custom404,
    htmlUrl,
    buildType,
    source,
    public,
    httpsCertificate,
    httpsEnforced,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Page &&
        url == other.url &&
        status == other.status &&
        cname == other.cname &&
        protectedDomainState == other.protectedDomainState &&
        pendingDomainUnverifiedAt == other.pendingDomainUnverifiedAt &&
        custom404 == other.custom404 &&
        htmlUrl == other.htmlUrl &&
        buildType == other.buildType &&
        source == other.source &&
        public == other.public &&
        httpsCertificate == other.httpsCertificate &&
        httpsEnforced == other.httpsEnforced;
  }
}
