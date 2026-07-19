import 'package:github/model_helpers.dart';
import 'package:github/models/secret_scanning_location_details.dart';
import 'package:github/models/secret_scanning_location_type.dart';
import 'package:meta/meta.dart';

@immutable
class SecretScanningLocation {
  const SecretScanningLocation({this.type, this.details});

  /// Converts a `Map<String, dynamic>` to a [SecretScanningLocation].
  factory SecretScanningLocation.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SecretScanningLocation',
      json,
      () => SecretScanningLocation(
        type: SecretScanningLocationType.maybeFromJson(json['type'] as String?),
        details: SecretScanningLocationDetails.maybeFromJson(
          json['details'] as Map<String, dynamic>?,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningLocation? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SecretScanningLocation.fromJson(json);
  }

  /// The location type. Because secrets may be found in different types of
  /// resources (ie. code, comments, issues, pull requests, discussions), this
  /// field identifies the type of resource where the secret was found.
  /// Example: `'commit'`
  final SecretScanningLocationType? type;
  final SecretScanningLocationDetails? details;

  /// Converts a [SecretScanningLocation] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (type != null) 'type': type?.toJson(),
      if (details != null) 'details': details?.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([type, details]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningLocation &&
        type == other.type &&
        details == other.details;
  }
}
