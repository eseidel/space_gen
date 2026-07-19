// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

sealed class IssuesUpdateRequestLabelsInner {
  const IssuesUpdateRequestLabelsInner();

  factory IssuesUpdateRequestLabelsInner.fromJson(dynamic json) {
    return switch (json) {
      final String v => IssuesUpdateRequestLabelsInnerString(v),
      final Map<String, dynamic> v =>
        IssuesUpdateRequestLabelsInnerOneOf1.fromJson(v),
      _ => throw FormatException(
        'Unsupported shape for IssuesUpdateRequestLabelsInner: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesUpdateRequestLabelsInner? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return IssuesUpdateRequestLabelsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class IssuesUpdateRequestLabelsInnerString
    extends IssuesUpdateRequestLabelsInner {
  const IssuesUpdateRequestLabelsInnerString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesUpdateRequestLabelsInnerString &&
        value == other.value;
  }
}

@immutable
final class IssuesUpdateRequestLabelsInnerOneOf1
    extends IssuesUpdateRequestLabelsInner {
  const IssuesUpdateRequestLabelsInnerOneOf1({
    this.id,
    this.name,
    this.description,
    this.color,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [IssuesUpdateRequestLabelsInnerOneOf1].
  factory IssuesUpdateRequestLabelsInnerOneOf1.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'IssuesUpdateRequestLabelsInnerOneOf1',
      json,
      () => IssuesUpdateRequestLabelsInnerOneOf1(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        color: json['color'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesUpdateRequestLabelsInnerOneOf1? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesUpdateRequestLabelsInnerOneOf1.fromJson(json);
  }

  final int? id;
  final String? name;
  final String? description;
  final String? color;

  /// Converts an [IssuesUpdateRequestLabelsInnerOneOf1]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'description': description, 'color': color};
  }

  @override
  int get hashCode => Object.hashAll([id, name, description, color]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesUpdateRequestLabelsInnerOneOf1 &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        color == other.color;
  }
}
