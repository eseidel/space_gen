import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/analyze_location_entity_field_state.dart';
import 'package:meta/meta.dart';

@immutable
class AnalyzeLocationEntityField {
  const AnalyzeLocationEntityField({
    required this.description,
    required this.value,
    required this.state,
    required this.field,
  });

  /// Converts a `Map<String, dynamic>` to an [AnalyzeLocationEntityField].
  factory AnalyzeLocationEntityField.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AnalyzeLocationEntityField',
      json,
      () => AnalyzeLocationEntityField(
        description: json['description'] as String,
        value: checkedKey(json, 'value') as String?,
        state: AnalyzeLocationEntityFieldState.fromJson(
          json['state'] as String,
        ),
        field: json['field'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AnalyzeLocationEntityField? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AnalyzeLocationEntityField.fromJson(json);
  }

  /// A text to show to the user to inform about the choices made. Like, it
  /// could say
  /// "Found a CODEOWNERS file that covers this target, so we suggest leaving
  /// this
  /// field empty; which would currently make it owned by X" where X is taken
  /// from the
  /// codeowners file.
  final String description;
  final String? value;

  /// The outcome of the analysis for this particular field
  final AnalyzeLocationEntityFieldState state;

  /// e.g. "spec.owner"? The frontend needs to know how to "inject" the field
  /// into the
  /// entity again if the user wants to change it
  final String field;

  /// Converts an [AnalyzeLocationEntityField] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'description': description,
      'value': value,
      'state': state.toJson(),
      'field': field,
    };
  }

  @override
  int get hashCode => Object.hashAll([description, value, state, field]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AnalyzeLocationEntityField &&
        description == other.description &&
        value == other.value &&
        state == other.state &&
        field == other.field;
  }
}
