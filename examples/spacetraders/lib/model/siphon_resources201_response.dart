import 'package:spacetraders/model/siphon_resources201_response_data.dart';

class SiphonResources201Response {
  SiphonResources201Response({required this.data});

  factory SiphonResources201Response.fromJson(Map<String, dynamic> json) {
    return SiphonResources201Response(
      data: SiphonResources201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SiphonResources201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SiphonResources201Response.fromJson(json);
  }

  final SiphonResources201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
