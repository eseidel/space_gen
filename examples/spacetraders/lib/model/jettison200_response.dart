import 'package:meta/meta.dart';
import 'package:spacetraders/model/jettison200_response_data.dart';

@immutable
class Jettison200Response {
  const Jettison200Response({required this.data});

  factory Jettison200Response.fromJson(Map<String, dynamic> json) {
    return Jettison200Response(
      data: Jettison200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Jettison200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Jettison200Response.fromJson(json);
  }

  final Jettison200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Jettison200Response && data == other.data;
  }
}
