// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:meta/meta.dart';

/// Default value of the property
sealed class CustomPropertySetPayloadDefaultValue {
  const CustomPropertySetPayloadDefaultValue();

  factory CustomPropertySetPayloadDefaultValue.fromJson(dynamic json) {
    return switch (json) {
      final String v => CustomPropertySetPayloadDefaultValueString(v),
      final List<dynamic> v => CustomPropertySetPayloadDefaultValueList(
        v.cast<String>(),
      ),
      _ => throw FormatException(
        'Unsupported shape for CustomPropertySetPayloadDefaultValue: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CustomPropertySetPayloadDefaultValue? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return CustomPropertySetPayloadDefaultValue.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class CustomPropertySetPayloadDefaultValueString
    extends CustomPropertySetPayloadDefaultValue {
  const CustomPropertySetPayloadDefaultValueString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomPropertySetPayloadDefaultValueString &&
        value == other.value;
  }
}

@immutable
final class CustomPropertySetPayloadDefaultValueList
    extends CustomPropertySetPayloadDefaultValue {
  const CustomPropertySetPayloadDefaultValueList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomPropertySetPayloadDefaultValueList &&
        value == other.value;
  }
}
