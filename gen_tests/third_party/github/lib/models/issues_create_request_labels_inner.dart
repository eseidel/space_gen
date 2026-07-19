// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

sealed class IssuesCreateRequestLabelsInner {
  const IssuesCreateRequestLabelsInner();

  factory IssuesCreateRequestLabelsInner.fromJson(dynamic json) {
    return switch (json) {
      final String v => IssuesCreateRequestLabelsInnerString(v),
      final Map<String, dynamic> v =>
        IssuesCreateRequestLabelsInnerOneOf1.fromJson(v),
      _ => throw FormatException(
        'Unsupported shape for IssuesCreateRequestLabelsInner: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesCreateRequestLabelsInner? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return IssuesCreateRequestLabelsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class IssuesCreateRequestLabelsInnerString
    extends IssuesCreateRequestLabelsInner {
  const IssuesCreateRequestLabelsInnerString(this.value);

  final String value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesCreateRequestLabelsInnerString &&
        value == other.value;
  }
}

@immutable
final class IssuesCreateRequestLabelsInnerOneOf1
    extends IssuesCreateRequestLabelsInner {
  const IssuesCreateRequestLabelsInnerOneOf1({
    this.id,
    this.name,
    this.description,
    this.color,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [IssuesCreateRequestLabelsInnerOneOf1].
  factory IssuesCreateRequestLabelsInnerOneOf1.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'IssuesCreateRequestLabelsInnerOneOf1',
      json,
      () => IssuesCreateRequestLabelsInnerOneOf1(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        color: json['color'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IssuesCreateRequestLabelsInnerOneOf1? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IssuesCreateRequestLabelsInnerOneOf1.fromJson(json);
  }

  final int? id;
  final String? name;
  final String? description;
  final String? color;

  /// Converts an [IssuesCreateRequestLabelsInnerOneOf1]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'id': ?id,
      'name': ?name,
      'description': description,
      'color': color,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, name, description, color]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is IssuesCreateRequestLabelsInnerOneOf1 &&
        id == other.id &&
        name == other.name &&
        description == other.description &&
        color == other.color;
  }
}
