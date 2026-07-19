/// Specifies whether this release should be set as the latest release for the
/// repository. Drafts and prereleases cannot be set as latest. Defaults to
/// `true` for newly published releases. `legacy` specifies that the latest
/// release should be determined based on the release creation date and higher
/// semantic version.
enum ReposCreateReleaseRequestMakeLatest {
  true_._('true'),
  false_._('false'),
  legacy._('legacy');

  const ReposCreateReleaseRequestMakeLatest._(this.value);

  /// Creates a ReposCreateReleaseRequestMakeLatest from a json value.
  factory ReposCreateReleaseRequestMakeLatest.fromJson(String json) {
    return ReposCreateReleaseRequestMakeLatest.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposCreateReleaseRequestMakeLatest value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposCreateReleaseRequestMakeLatest? maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateReleaseRequestMakeLatest.fromJson(json);
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
