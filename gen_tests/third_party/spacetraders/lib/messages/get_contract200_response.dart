import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/contract.dart';

/// {@template get_contract200_response}
/// Successfully fetched contract.
/// {@endtemplate}
@immutable
class GetContract200Response {
  /// {@macro get_contract200_response}
  const GetContract200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetContract200Response].
  factory GetContract200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetContract200Response',
      json,
      () => GetContract200Response(
        data: Contract.fromJson(json['data'] as Map<String, dynamic>),
      ),
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

  /// Contract details.
  final Contract data;

  /// Converts a [GetContract200Response] to a `Map<String, dynamic>`.
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
