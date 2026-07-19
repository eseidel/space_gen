import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsReRunWorkflowFailedJobsRequest {
  const ActionsReRunWorkflowFailedJobsRequest({
    this.enableDebugLogging = false,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsReRunWorkflowFailedJobsRequest].
  factory ActionsReRunWorkflowFailedJobsRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsReRunWorkflowFailedJobsRequest',
      json,
      () => ActionsReRunWorkflowFailedJobsRequest(
        enableDebugLogging: (json['enable_debug_logging'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsReRunWorkflowFailedJobsRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsReRunWorkflowFailedJobsRequest.fromJson(json);
  }

  /// Whether to enable debug logging for the re-run.
  final bool enableDebugLogging;

  /// Converts an [ActionsReRunWorkflowFailedJobsRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'enable_debug_logging': enableDebugLogging};
  }

  @override
  int get hashCode => enableDebugLogging.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsReRunWorkflowFailedJobsRequest &&
        enableDebugLogging == other.enableDebugLogging;
  }
}
