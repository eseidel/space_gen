import 'package:meta/meta.dart';
import 'package:spacetraders/model/install_mount201_response_data.dart';

@immutable
class InstallMount201Response {
  const InstallMount201Response({required this.data});

  factory InstallMount201Response.fromJson(Map<String, dynamic> json) {
    return InstallMount201Response(
      data: InstallMount201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
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
