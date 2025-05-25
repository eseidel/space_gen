import 'package:meta/meta.dart';
import 'package:spacetraders/model/system.dart';

@immutable
class GetSystem200Response {
  const GetSystem200Response({required this.data});

  factory GetSystem200Response.fromJson(Map<String, dynamic> json) {
    return GetSystem200Response(
      data: System.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetSystem200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetSystem200Response.fromJson(json);
  }

  final System data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetSystem200Response && data == other.data;
  }
}
