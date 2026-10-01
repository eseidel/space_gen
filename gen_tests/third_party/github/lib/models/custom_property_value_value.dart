// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';

/// The value assigned to the property
sealed class CustomPropertyValueValue {
  const CustomPropertyValueValue();

  factory CustomPropertyValueValue.fromJson(dynamic json) {
    return switch (json) {
      final String v => CustomPropertyValueValueString(v),
      final List<dynamic> v => CustomPropertyValueValueList(v.cast<String>()),
      _ => throw FormatException(
        'Unsupported shape for CustomPropertyValueValue: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CustomPropertyValueValue? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return CustomPropertyValueValue.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class CustomPropertyValueValueString extends CustomPropertyValueValue {
  const CustomPropertyValueValueString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomPropertyValueValueString && value == other.value;
  }
}

@immutable
final class CustomPropertyValueValueList extends CustomPropertyValueValue {
  const CustomPropertyValueValueList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CustomPropertyValueValueList && value == other.value;
  }
}
