import 'package:meta/meta.dart';
import 'package:spacetraders/model_helpers.dart';

/// {@template agent_event}
/// Agent event details.
/// {@endtemplate}
@immutable
class AgentEvent {
  /// {@macro agent_event}
  const AgentEvent({
    required this.id,
    required this.type,
    required this.message,
    required this.createdAt,
    this.data,
  });

  /// Converts a `Map<String, dynamic>` to an [AgentEvent].
  factory AgentEvent.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'AgentEvent',
      json,
      () => AgentEvent(
        id: json['id'] as String,
        type: json['type'] as String,
        message: json['message'] as String,
        data: json['data'],
        createdAt: DateTime.parse(json['createdAt'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AgentEvent? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return AgentEvent.fromJson(json);
  }

  final String id;
  final String type;
  final String message;
  final dynamic data;
  final DateTime createdAt;

  /// Converts an [AgentEvent] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'message': message,
      'data': ?data,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, type, message, data, createdAt]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AgentEvent &&
        id == other.id &&
        type == other.type &&
        message == other.message &&
        data == other.data &&
        createdAt == other.createdAt;
  }
}
