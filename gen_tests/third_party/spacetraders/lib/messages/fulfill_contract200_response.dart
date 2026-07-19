import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/fulfill_contract200_response_data.dart';

/// {@template fulfill_contract200_response}
/// Successfully fulfilled a contract.
/// {@endtemplate}
@immutable
class FulfillContract200Response {
  /// {@macro fulfill_contract200_response}
  const FulfillContract200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [FulfillContract200Response].
  factory FulfillContract200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'FulfillContract200Response',
      json,
      () => FulfillContract200Response(
        data: FulfillContract200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static FulfillContract200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return FulfillContract200Response.fromJson(json);
  }

  final FulfillContract200ResponseData data;

  /// Converts a [FulfillContract200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is FulfillContract200Response && data == other.data;
  }
}
