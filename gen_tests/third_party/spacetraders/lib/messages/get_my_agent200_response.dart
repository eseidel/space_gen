import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/agent.dart';

/// {@template get_my_agent200_response}
/// Successfully fetched agent details.
/// {@endtemplate}
@immutable
class GetMyAgent200Response {
  /// {@macro get_my_agent200_response}
  const GetMyAgent200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetMyAgent200Response].
  factory GetMyAgent200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetMyAgent200Response',
      json,
      () => GetMyAgent200Response(
        data: Agent.fromJson(json['data'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyAgent200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetMyAgent200Response.fromJson(json);
  }

  /// Agent details.
  final Agent data;

  /// Converts a [GetMyAgent200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetMyAgent200Response && data == other.data;
  }
}
