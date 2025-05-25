import 'package:meta/meta.dart';
import 'package:spacetraders/model/construction.dart';

@immutable
class GetConstruction200Response {
  const GetConstruction200Response({required this.data});

  factory GetConstruction200Response.fromJson(Map<String, dynamic> json) {
    return GetConstruction200Response(
      data: Construction.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetConstruction200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetConstruction200Response.fromJson(json);
  }

  final Construction data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetConstruction200Response && data == other.data;
  }
}
