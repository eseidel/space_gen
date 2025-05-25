import 'package:meta/meta.dart';
import 'package:spacetraders/model/contract.dart';

@immutable
class GetContract200Response {
  const GetContract200Response({required this.data});

  factory GetContract200Response.fromJson(Map<String, dynamic> json) {
    return GetContract200Response(
      data: Contract.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetContract200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetContract200Response.fromJson(json);
  }

  final Contract data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetContract200Response && data == other.data;
  }
}
