import 'package:github/model_helpers.dart';
import 'package:github/models/runner_label.dart';
import 'package:meta/meta.dart';

@immutable
class ActionsRunnerLabelsReadonlyResponse {
  const ActionsRunnerLabelsReadonlyResponse({
    required this.totalCount,
    required this.labels,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [ActionsRunnerLabelsReadonlyResponse].
  factory ActionsRunnerLabelsReadonlyResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ActionsRunnerLabelsReadonlyResponse',
      json,
      () => ActionsRunnerLabelsReadonlyResponse(
        totalCount: json['total_count'] as int,
        labels: (json['labels'] as List)
            .map<RunnerLabel>(
              (e) => RunnerLabel.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActionsRunnerLabelsReadonlyResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ActionsRunnerLabelsReadonlyResponse.fromJson(json);
  }

  final int totalCount;
  final List<RunnerLabel> labels;

  /// Converts an [ActionsRunnerLabelsReadonlyResponse]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'labels': labels.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(labels)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActionsRunnerLabelsReadonlyResponse &&
        totalCount == other.totalCount &&
        listsEqual(labels, other.labels);
  }
}
