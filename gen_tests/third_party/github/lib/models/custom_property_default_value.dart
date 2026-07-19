import 'package:meta/meta.dart';

/// Default value of the property
sealed class CustomPropertyDefaultValue {
  const CustomPropertyDefaultValue();

  factory CustomPropertyDefaultValue.fromJson(dynamic json) {
    return switch (json) {
      final String v => CustomPropertyDefaultValueString(v),
      final List<dynamic> v => CustomPropertyDefaultValueList(v.cast<String>()),
      _ => throw FormatException(
        'Unsupported shape for CustomPropertyDefaultValue: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CustomPropertyDefaultValue? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return CustomPropertyDefaultValue.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class CustomPropertyDefaultValueString
    extends CustomPropertyDefaultValue {
  const CustomPropertyDefaultValueString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomPropertyDefaultValueString && value == other.value;
  }
}

@immutable
final class CustomPropertyDefaultValueList extends CustomPropertyDefaultValue {
  const CustomPropertyDefaultValueList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomPropertyDefaultValueList && value == other.value;
  }
}
