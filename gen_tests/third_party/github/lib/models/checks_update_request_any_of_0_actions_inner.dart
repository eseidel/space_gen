import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ChecksUpdateRequestAnyOf0ActionsInner {
  ChecksUpdateRequestAnyOf0ActionsInner({
    required this.label,
    required this.description,
    required this.identifier,
  }) {
    label.validate(maxLength: 20);
    description.validate(maxLength: 40);
    identifier.validate(maxLength: 20);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [ChecksUpdateRequestAnyOf0ActionsInner].
  factory ChecksUpdateRequestAnyOf0ActionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ChecksUpdateRequestAnyOf0ActionsInner',
      json,
      () => ChecksUpdateRequestAnyOf0ActionsInner(
        label: json['label'] as String,
        description: json['description'] as String,
        identifier: json['identifier'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksUpdateRequestAnyOf0ActionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChecksUpdateRequestAnyOf0ActionsInner.fromJson(json);
  }

  /// The text to be displayed on a button in the web UI. The maximum size is
  /// 20 characters.
  final String label;

  /// A short explanation of what this action would do. The maximum size is 40
  /// characters.
  final String description;

  /// A reference for the action on the integrator's system. The maximum size
  /// is 20 characters.
  final String identifier;

  /// Converts a [ChecksUpdateRequestAnyOf0ActionsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'description': description,
      'identifier': identifier,
    };
  }

  @override
  int get hashCode => Object.hashAll([label, description, identifier]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChecksUpdateRequestAnyOf0ActionsInner &&
        label == other.label &&
        description == other.description &&
        identifier == other.identifier;
  }
}
