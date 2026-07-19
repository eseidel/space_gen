import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/system.dart';

/// {@template get_system200_response}
/// Successfully fetched the system.
/// {@endtemplate}
@immutable
class GetSystem200Response {
  /// {@macro get_system200_response}
  const GetSystem200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetSystem200Response].
  factory GetSystem200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetSystem200Response',
      json,
      () => GetSystem200Response(
        data: System.fromJson(json['data'] as Map<String, dynamic>),
      ),
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

  /// System details.
  final System data;

  /// Converts a [GetSystem200Response] to a `Map<String, dynamic>`.
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
