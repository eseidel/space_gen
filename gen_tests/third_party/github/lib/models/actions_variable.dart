import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template actions_variable}
/// Actions Variable
/// {@endtemplate}
@immutable
class ActionsVariable {
  /// {@macro actions_variable}
  const ActionsVariable({
    required this.name,
    required this.value,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Converts a `Map<String, dynamic>` to an [ActionsVariable].
  factory ActionsVariable.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsVariable',
      json,
      () => ActionsVariable(
        name: json['name'] as String,
        value: json['value'] as String,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsVariable? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ActionsVariable.fromJson(json);
  }

  /// The name of the variable.
  /// Example: `'USERNAME'`
  final String name;

  /// The value of the variable.
  /// Example: `'octocat'`
  final String value;

  /// The date and time at which the variable was created, in ISO 8601
  /// format':' YYYY-MM-DDTHH:MM:SSZ.
  /// Example: `'2019-01-24T22:45:36.000Z'`
  final DateTime createdAt;

  /// The date and time at which the variable was last updated, in ISO 8601
  /// format':' YYYY-MM-DDTHH:MM:SSZ.
  /// Example: `'2019-01-24T22:45:36.000Z'`
  final DateTime updatedAt;

  /// Converts an [ActionsVariable] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([name, value, createdAt, updatedAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsVariable &&
        name == other.name &&
        value == other.value &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
