import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';
import 'package:spacetraders/models/agent_event.dart';

@immutable
class GetMyAgentEvents200Response {
  const GetMyAgentEvents200Response({required this.data});

  /// Converts a `Map<String, dynamic>` to a [GetMyAgentEvents200Response].
  factory GetMyAgentEvents200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GetMyAgentEvents200Response',
      json,
      () => GetMyAgentEvents200Response(
        data: (json['data'] as List)
            .map<AgentEvent>(
              (e) => AgentEvent.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GetMyAgentEvents200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return GetMyAgentEvents200Response.fromJson(json);
  }

  final List<AgentEvent> data;

  /// Converts a [GetMyAgentEvents200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'data': data.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => listHash(data).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetMyAgentEvents200Response && listsEqual(data, other.data);
  }
}
