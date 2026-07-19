// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/orgs_enable_or_disable_security_product_on_all_org_repos_request_query_suite.dart';
import 'package:meta/meta.dart';

@immutable
class OrgsEnableOrDisableSecurityProductOnAllOrgReposRequest {
  const OrgsEnableOrDisableSecurityProductOnAllOrgReposRequest({
    this.querySuite,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [OrgsEnableOrDisableSecurityProductOnAllOrgReposRequest].
  factory OrgsEnableOrDisableSecurityProductOnAllOrgReposRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'OrgsEnableOrDisableSecurityProductOnAllOrgReposRequest',
      json,
      () => OrgsEnableOrDisableSecurityProductOnAllOrgReposRequest(
        querySuite:
            OrgsEnableOrDisableSecurityProductOnAllOrgReposRequestQuerySuite.maybeFromJson(
              json['query_suite'] as String?,
            ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgsEnableOrDisableSecurityProductOnAllOrgReposRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return OrgsEnableOrDisableSecurityProductOnAllOrgReposRequest.fromJson(
      json,
    );
  }

  /// CodeQL query suite to be used. If you specify the `query_suite`
  /// parameter, the default setup will be configured with this query suite
  /// only on all repositories that didn't have default setup already
  /// configured. It will not change the query suite on repositories that
  /// already have default setup configured.
  /// If you don't specify any `query_suite` in your request, the preferred
  /// query suite of the organization will be applied.
  final OrgsEnableOrDisableSecurityProductOnAllOrgReposRequestQuerySuite?
  querySuite;

  /// Converts an [OrgsEnableOrDisableSecurityProductOnAllOrgReposRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {if (querySuite != null) 'query_suite': querySuite?.toJson()};
  }

  @override
  int get hashCode => querySuite.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgsEnableOrDisableSecurityProductOnAllOrgReposRequest &&
        querySuite == other.querySuite;
  }
}
