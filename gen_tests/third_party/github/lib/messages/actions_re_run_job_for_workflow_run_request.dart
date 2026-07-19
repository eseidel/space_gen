import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsReRunJobForWorkflowRunRequest {
  const ActionsReRunJobForWorkflowRunRequest({this.enableDebugLogging = false});

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsReRunJobForWorkflowRunRequest].
  factory ActionsReRunJobForWorkflowRunRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsReRunJobForWorkflowRunRequest',
      json,
      () => ActionsReRunJobForWorkflowRunRequest(
        enableDebugLogging: (json['enable_debug_logging'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsReRunJobForWorkflowRunRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsReRunJobForWorkflowRunRequest.fromJson(json);
  }

  /// Whether to enable debug logging for the re-run.
  final bool? enableDebugLogging;

  /// Converts an [ActionsReRunJobForWorkflowRunRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enable_debug_logging': enableDebugLogging};
  }

  @override
  int get hashCode => enableDebugLogging.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsReRunJobForWorkflowRunRequest &&
        enableDebugLogging == other.enableDebugLogging;
  }
}
