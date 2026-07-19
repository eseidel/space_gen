import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/get_my_account200_response_data.dart';

@immutable
class GetMyAccount200Response {
  const GetMyAccount200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetMyAccount200Response].
  factory GetMyAccount200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetMyAccount200Response',
      json,
      () => GetMyAccount200Response(
        data: GetMyAccount200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyAccount200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetMyAccount200Response.fromJson(json);
  }

  final GetMyAccount200ResponseData data;

  /// Converts a [GetMyAccount200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetMyAccount200Response && data == other.data;
  }
}
