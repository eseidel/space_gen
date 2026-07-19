import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/deliver_contract200_response_data.dart';

/// {@template deliver_contract200_response}
/// Successfully delivered cargo to contract.
/// {@endtemplate}
@immutable
class DeliverContract200Response {
  /// {@macro deliver_contract200_response}
  const DeliverContract200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [DeliverContract200Response].
  factory DeliverContract200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'DeliverContract200Response',
      json,
      () => DeliverContract200Response(
        data: DeliverContract200ResponseData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static DeliverContract200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return DeliverContract200Response.fromJson(json);
  }

  final DeliverContract200ResponseData data;

  /// Converts a [DeliverContract200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is DeliverContract200Response && data == other.data;
  }
}
