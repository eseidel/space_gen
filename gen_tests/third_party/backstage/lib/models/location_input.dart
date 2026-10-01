// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class LocationInput {
  const LocationInput({required this.type, required this.target});

  /// Converts a `Map<String, dynamic>` to a [LocationInput].
  factory LocationInput.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LocationInput',
      json,
      () => LocationInput(
        type: json['type'] as String,
        target: json['target'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LocationInput? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LocationInput.fromJson(json);
  }

  final String type;
  final String target;

  /// Converts a [LocationInput] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type, 'target': target};
  }

  @override
  int get hashCode => Object.hashAll([type, target]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationInput &&
        type == other.type &&
        target == other.target;
  }
}
