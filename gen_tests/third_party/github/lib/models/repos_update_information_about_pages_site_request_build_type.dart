// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The process by which the GitHub Pages site will be built. `workflow` means
/// that the site is built by a custom GitHub Actions workflow. `legacy` means
/// that the site is built by GitHub when changes are pushed to a specific
/// branch.
enum ReposUpdateInformationAboutPagesSiteRequestBuildType {
  legacy._('legacy'),
  workflow._('workflow');

  const ReposUpdateInformationAboutPagesSiteRequestBuildType._(this.value);

  /// Creates a ReposUpdateInformationAboutPagesSiteRequestBuildType from a json value.
  factory ReposUpdateInformationAboutPagesSiteRequestBuildType.fromJson(
    String json,
  ) {
    return ReposUpdateInformationAboutPagesSiteRequestBuildType.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown ReposUpdateInformationAboutPagesSiteRequestBuildType value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ReposUpdateInformationAboutPagesSiteRequestBuildType? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposUpdateInformationAboutPagesSiteRequestBuildType.fromJson(json);
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
