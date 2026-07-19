import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ChecksCreateRequestOneOf1ActionsInner {
  const ChecksCreateRequestOneOf1ActionsInner({
    required this.label,
    required this.description,
    required this.identifier,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ChecksCreateRequestOneOf1ActionsInner].
  factory ChecksCreateRequestOneOf1ActionsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ChecksCreateRequestOneOf1ActionsInner',
      json,
      () => ChecksCreateRequestOneOf1ActionsInner(
        label: json['label'] as String,
        description: json['description'] as String,
        identifier: json['identifier'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksCreateRequestOneOf1ActionsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChecksCreateRequestOneOf1ActionsInner.fromJson(json);
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

  /// Converts a [ChecksCreateRequestOneOf1ActionsInner]
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
    return other is ChecksCreateRequestOneOf1ActionsInner &&
        label == other.label &&
        description == other.description &&
        identifier == other.identifier;
  }
}
