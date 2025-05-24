import 'package:spacetraders/model/create_chart201_response_data.dart';

class CreateChart201Response {
  CreateChart201Response({required this.data});

  factory CreateChart201Response.fromJson(Map<String, dynamic> json) {
    return CreateChart201Response(
      data: CreateChart201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CreateChart201Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CreateChart201Response.fromJson(json);
  }

  final CreateChart201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }
}
