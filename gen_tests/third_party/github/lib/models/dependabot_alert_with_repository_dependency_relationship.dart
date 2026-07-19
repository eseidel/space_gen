// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
/// The vulnerable dependency's relationship to your project.
///
/// > [!NOTE]
/// > We are rolling out support for dependency relationship across ecosystems.
/// This value will be "unknown" for all dependencies in unsupported ecosystems.
enum DependabotAlertWithRepositoryDependencyRelationship {
  unknown._('unknown'),
  direct._('direct'),
  transitive._('transitive');

  const DependabotAlertWithRepositoryDependencyRelationship._(this.value);

  /// Creates a DependabotAlertWithRepositoryDependencyRelationship from a json value.
  factory DependabotAlertWithRepositoryDependencyRelationship.fromJson(
    String json,
  ) {
    return DependabotAlertWithRepositoryDependencyRelationship.values.firstWhere(
      (value) => value.value == json,
      orElse: () => throw FormatException(
        'Unknown DependabotAlertWithRepositoryDependencyRelationship value: $json',
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static DependabotAlertWithRepositoryDependencyRelationship? maybeFromJson(
    String? json,
  ) {
    if (json == null) {
      return null;
    }
    return DependabotAlertWithRepositoryDependencyRelationship.fromJson(json);
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
