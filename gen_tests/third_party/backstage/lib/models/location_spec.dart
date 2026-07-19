import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template location_spec}
/// Holds the entity location information.
/// {@endtemplate}
@immutable
class LocationSpec {
  /// {@macro location_spec}
  const LocationSpec({required this.target, required this.type});

  /// Converts a `Map<String, dynamic>` to a [LocationSpec].
  factory LocationSpec.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LocationSpec',
      json,
      () => LocationSpec(
        target: json['target'] as String,
        type: json['type'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LocationSpec? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LocationSpec.fromJson(json);
  }

  final String target;
  final String type;

  /// Converts a [LocationSpec] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'target': target, 'type': type};
  }

  @override
  int get hashCode => Object.hashAll([target, type]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationSpec &&
        target == other.target &&
        type == other.type;
  }
}
