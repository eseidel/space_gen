// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
/// The level of the annotation.
enum ChecksUpdateRequestAnyOf1OutputAnnotationsInnerAnnotationLevel {
  notice._('notice'),
  warning._('warning'),
  failure._('failure');

  const ChecksUpdateRequestAnyOf1OutputAnnotationsInnerAnnotationLevel._(
    this.value,
  );

  /// Creates a ChecksUpdateRequestAnyOf1OutputAnnotationsInnerAnnotationLevel from a json value.
  factory ChecksUpdateRequestAnyOf1OutputAnnotationsInnerAnnotationLevel.fromJson(
    String json,
  ) {
    return ChecksUpdateRequestAnyOf1OutputAnnotationsInnerAnnotationLevel.values
        .firstWhere(
          (value) => value.value == json,
          orElse: () => throw FormatException(
            'Unknown ChecksUpdateRequestAnyOf1OutputAnnotationsInnerAnnotationLevel value: $json',
          ),
        );
  }

  /// Convenience to create a nullable type from a nullable json value.
  /// Useful when parsing optional fields.
  static ChecksUpdateRequestAnyOf1OutputAnnotationsInnerAnnotationLevel?
  maybeFromJson(String? json) {
    if (json == null) {
      return null;
    }
    return ChecksUpdateRequestAnyOf1OutputAnnotationsInnerAnnotationLevel.fromJson(
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
