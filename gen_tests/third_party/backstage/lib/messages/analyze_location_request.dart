import 'package:backstage/model_helpers.dart';
import 'package:backstage/models/location_input.dart';
import 'package:meta/meta.dart';

@immutable
class AnalyzeLocationRequest {
  const AnalyzeLocationRequest({required this.location, this.catalogFileName});

  /// Converts a `Map<String, dynamic>` to an [AnalyzeLocationRequest].
  factory AnalyzeLocationRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AnalyzeLocationRequest',
      json,
      () => AnalyzeLocationRequest(
        catalogFileName: json['catalogFileName'] as String?,
        location: LocationInput.fromJson(
          json['location'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AnalyzeLocationRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AnalyzeLocationRequest.fromJson(json);
  }

  final String? catalogFileName;
  final LocationInput location;

  /// Converts an [AnalyzeLocationRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (catalogFileName != null) 'catalogFileName': catalogFileName,
      'location': location.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([catalogFileName, location]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AnalyzeLocationRequest &&
        catalogFileName == other.catalogFileName &&
        location == other.location;
  }
}
