import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/meta.dart';
import 'package:spacetraders/models/public_agent.dart';

/// {@template get_agents200_response}
/// Successfully fetched agents details.
/// {@endtemplate}
@immutable
class GetAgents200Response {
  /// {@macro get_agents200_response}
  const GetAgents200Response({required this.data, required this.meta});

  /// Converts a `Map<String, dynamic>` to a [GetAgents200Response].
  factory GetAgents200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetAgents200Response',
      json,
      () => GetAgents200Response(
        data: (json['data'] as List)
            .map<PublicAgent>(
              (e) => PublicAgent.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetAgents200Response? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GetAgents200Response.fromJson(json);
  }

  final List<PublicAgent> data;

  /// Meta details for pagination.
  final Meta meta;

  /// Converts a [GetAgents200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'data': data.map((e) => e.toJson()).toList(),
      'meta': meta.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([listHash(data), meta]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetAgents200Response &&
        listsEqual(data, other.data) &&
        meta == other.meta;
  }
}
