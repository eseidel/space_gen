import 'package:github/model_helpers.dart';
import 'package:github/models/workflow.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsListRepoWorkflows200Response {
  const ActionsListRepoWorkflows200Response({
    required this.totalCount,
    required this.workflows,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsListRepoWorkflows200Response].
  factory ActionsListRepoWorkflows200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsListRepoWorkflows200Response',
      json,
      () => ActionsListRepoWorkflows200Response(
        totalCount: json['total_count'] as int,
        workflows: (json['workflows'] as List)
            .map<Workflow>((e) => Workflow.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsListRepoWorkflows200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsListRepoWorkflows200Response.fromJson(json);
  }

  final int totalCount;
  final List<Workflow> workflows;

  /// Converts an [ActionsListRepoWorkflows200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'workflows': workflows.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(workflows)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsListRepoWorkflows200Response &&
        totalCount == other.totalCount &&
        listsEqual(workflows, other.workflows);
  }
}
