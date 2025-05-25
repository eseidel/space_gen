import 'package:meta/meta.dart';
import 'package:spacetraders/model/accept_contract200_response_data.dart';

@immutable
class AcceptContract200Response {
  const AcceptContract200Response({required this.data});

  factory AcceptContract200Response.fromJson(Map<String, dynamic> json) {
    return AcceptContract200Response(
      data: AcceptContract200ResponseData.fromJson(
        json['data'] as Map<String, dynamic>,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AcceptContract200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AcceptContract200Response.fromJson(json);
  }

  final AcceptContract200ResponseData data;

  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AcceptContract200Response && data == other.data;
  }
}
