class AgentEvent {
  AgentEvent({
    required this.id,
    required this.type,
    required this.message,
    required this.createdAt,
    this.data,
  });

  factory AgentEvent.fromJson(Map<String, dynamic> json) {
    return AgentEvent(
      id: json['id'] as String,
      type: json['type'] as String,
      message: json['message'] as String,
      data: json['data'],
      createdAt: DateTime.parse(json['createdAt'] as String),
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'message': message,
      'data': data,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
