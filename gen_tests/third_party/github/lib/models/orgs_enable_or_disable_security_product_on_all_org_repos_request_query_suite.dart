// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// CodeQL query suite to be used. If you specify the `query_suite` parameter,
/// the default setup will be configured with this query suite only on all
/// repositories that didn't have default setup already configured. It will not
/// change the query suite on repositories that already have default setup
/// configured.
/// If you don't specify any `query_suite` in your request, the preferred query
/// suite of the organization will be applied.
enum OrgsEnableOrDisableSecurityProductOnAllOrgReposRequestQuerySuite {
  default_._('default'),
  extended._('extended');

  const OrgsEnableOrDisableSecurityProductOnAllOrgReposRequestQuerySuite._(
    this.value,
  );

  /// Creates a OrgsEnableOrDisableSecurityProductOnAllOrgReposRequestQuerySuite from a json value.
  factory OrgsEnableOrDisableSecurityProductOnAllOrgReposRequestQuerySuite.fromJson(
    String json,
  ) {
    return OrgsEnableOrDisableSecurityProductOnAllOrgReposRequestQuerySuite
        .values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown OrgsEnableOrDisableSecurityProductOnAllOrgReposRequestQuerySuite value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static OrgsEnableOrDisableSecurityProductOnAllOrgReposRequestQuerySuite?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return OrgsEnableOrDisableSecurityProductOnAllOrgReposRequestQuerySuite.fromJson(
      json,
    );
  }

  /// The value of the enum.  This is the exact value
  /// from the OpenAPI spec and will be used for network transport.
  final String value;

  /// Converts the enum to its json value.
  String toJson() => value;

  /// Returns the string form of the enum.
  @override
  String toString() => value;
}
