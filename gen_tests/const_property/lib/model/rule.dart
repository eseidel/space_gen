import 'package:const_property/model_helpers.dart';

/// {@template rule}
/// A repository rule.
/// {@endtemplate}

class Rule {
  /// {@macro rule}
  Rule({this.workflows});

  /// Converts a `Map<String, dynamic>` to a [Rule].
  factory Rule.fromJson(dynamic jsonArg) {
    final json = jsonArg as Map<String, dynamic>;
    return parseFromJson(
      'Rule',
      json,
      () => Rule(workflows: json['workflows'] as String?),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Rule? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Rule.fromJson(json);
  }

  /// The single legal value of `workflows`, exposed so it can be set
  /// explicitly.
  static const String workflowsValue = 'write';

  /// The rule type.
  String get type => 'creation';
  String? workflows;

  /// Converts a [Rule] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type, 'workflows': ?workflows};
  }

  @override
  int get hashCode => workflows.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Rule && workflows == other.workflows;
  }
}
