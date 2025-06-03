import 'package:meta/meta.dart';
import 'package:spacetraders/model/agent_event.dart';
import 'package:spacetraders/model_helpers.dart';

@immutable
class GetMyAgentEvents200Response {
  const GetMyAgentEvents200Response({this.data = const []});

  factory GetMyAgentEvents200Response.fromJson(Map<String, dynamic> json) {
    return GetMyAgentEvents200Response(
      data: (json['data'] as List)
          .map<AgentEvent>(
            (e) => AgentEvent.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
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

  Map<String, dynamic> toJson() {
    return {'data': data.map((e) => e.toJson()).toList()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GetMyAgentEvents200Response && listsEqual(data, other.data);
  }
}
