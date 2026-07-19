// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:meta/meta.dart';

sealed class ValidationErrorErrorsInnerValue {
  const ValidationErrorErrorsInnerValue();

  factory ValidationErrorErrorsInnerValue.fromJson(dynamic json) {
    return switch (json) {
      final String v => ValidationErrorErrorsInnerValueString(v),
      final int v => ValidationErrorErrorsInnerValueInt(v),
      final List<dynamic> v => ValidationErrorErrorsInnerValueList(
        v.cast<String>(),
      ),
      _ => throw FormatException(
        'Unsupported shape for ValidationErrorErrorsInnerValue: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ValidationErrorErrorsInnerValue? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ValidationErrorErrorsInnerValue.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class ValidationErrorErrorsInnerValueString
    extends ValidationErrorErrorsInnerValue {
  const ValidationErrorErrorsInnerValueString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValidationErrorErrorsInnerValueString &&
        value == other.value;
  }
}

@immutable
final class ValidationErrorErrorsInnerValueInt
    extends ValidationErrorErrorsInnerValue {
  const ValidationErrorErrorsInnerValueInt(this.value);

  final int value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValidationErrorErrorsInnerValueInt && value == other.value;
  }
}

@immutable
final class ValidationErrorErrorsInnerValueList
    extends ValidationErrorErrorsInnerValue {
  const ValidationErrorErrorsInnerValueList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValidationErrorErrorsInnerValueList && value == other.value;
  }
}
