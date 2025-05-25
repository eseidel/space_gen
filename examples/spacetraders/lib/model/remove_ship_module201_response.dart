import 'package:meta/meta.dart';
import 'package:spacetraders/model/remove_ship_module201_response_data.dart';

@immutable
class RemoveShipModule201Response {
  const RemoveShipModule201Response({required this.data});

  factory RemoveShipModule201Response.fromJson(Map<String, dynamic> json) {
    return RemoveShipModule201Response(
      data: RemoveShipModule201ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RemoveShipModule201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RemoveShipModule201Response.fromJson(json);
  }

  final RemoveShipModule201ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RemoveShipModule201Response && data == other.data;
  }
}
