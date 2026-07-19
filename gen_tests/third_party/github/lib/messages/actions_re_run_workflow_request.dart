import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsReRunWorkflowRequest {
  const ActionsReRunWorkflowRequest({this.enableDebugLogging = false});

  /// Converts a `Map<String, dynamic>` to an [ActionsReRunWorkflowRequest].
  factory ActionsReRunWorkflowRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ActionsReRunWorkflowRequest',
      json,
      () => ActionsReRunWorkflowRequest(
        enableDebugLogging: (json['enable_debug_logging'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsReRunWorkflowRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsReRunWorkflowRequest.fromJson(json);
  }

  /// Whether to enable debug logging for the re-run.
  final bool enableDebugLogging;

  /// Converts an [ActionsReRunWorkflowRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enable_debug_logging': enableDebugLogging};
  }

  @override
  int get hashCode => enableDebugLogging.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsReRunWorkflowRequest &&
        enableDebugLogging == other.enableDebugLogging;
  }
}
