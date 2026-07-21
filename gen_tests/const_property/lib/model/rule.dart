// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:const_property/model_helpers.dart';

/// {@template rule}
/// The single-value `enum: [X]` spelling of a fixed value (how github tags its
/// discriminated-union variants). A *required* one (`type`) collapses to a
/// fixed getter, dropping the throwaway single-value enum type (issue #239); an
/// *optional* one (`workflows`) stays an omittable plain-scalar field with the
/// value surfaced as a `static const` (`workflowsValue`).
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

  /// The single legal value of [workflows], exposed so it can be set
  /// explicitly.
  static const String workflowsValue = 'write';

  /// Required tag fixed to the one member 'creation'.
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
