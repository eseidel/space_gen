import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/install_mount201_response_data.dart';

/// {@template install_mount201_response}
/// Install Mount 201 Response
/// Successfully installed the mount.
/// {@endtemplate}
@immutable
class InstallMount201Response {
  /// {@macro install_mount201_response}
  const InstallMount201Response({required this.data});

  /// Converts a `Map<String, dynamic>` to an [InstallMount201Response].
  factory InstallMount201Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'InstallMount201Response',
      json,
      () => InstallMount201Response(
        data: InstallMount201ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static InstallMount201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return InstallMount201Response.fromJson(json);
  }

  final InstallMount201ResponseData data;

  /// Converts an [InstallMount201Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is InstallMount201Response && data == other.data;
  }
}
