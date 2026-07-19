import 'package:github/model_helpers.dart';
import 'package:github/models/runner_label.dart';
import 'package:meta/meta.dart';

/// {@template runner}
/// Self hosted runners
/// A self hosted runner
/// {@endtemplate}
@immutable
class Runner {
  /// {@macro runner}
  const Runner({
    required this.id,
    required this.name,
    required this.os,
    required this.status,
    required this.busy,
    required this.labels,
    this.runnerGroupId,
    this.ephemeral,
  });

  /// Converts a `Map<String, dynamic>` to a [Runner].
  factory Runner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Runner',
      json,
      () => Runner(
        id: json['id'] as int,
        runnerGroupId: json['runner_group_id'] as int?,
        name: json['name'] as String,
        os: json['os'] as String,
        status: json['status'] as String,
        busy: json['busy'] as bool,
        labels: (json['labels'] as List)
            .map<RunnerLabel>(
              (e) => RunnerLabel.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        ephemeral: json['ephemeral'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Runner? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Runner.fromJson(json);
  }

  /// The ID of the runner.
  /// Example: `5`
  final int id;

  /// The ID of the runner group.
  /// Example: `1`
  final int? runnerGroupId;

  /// The name of the runner.
  /// Example: `'iMac'`
  final String name;

  /// The Operating System of the runner.
  /// Example: `'macos'`
  final String os;

  /// The status of the runner.
  /// Example: `'online'`
  final String status;
  final bool busy;
  final List<RunnerLabel> labels;
  final bool? ephemeral;

  /// Converts a [Runner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      if (runnerGroupId != null) 'runner_group_id': runnerGroupId,
      'name': name,
      'os': os,
      'status': status,
      'busy': busy,
      'labels': labels.map((e) => e.toJson()).toList(),
      if (ephemeral != null) 'ephemeral': ephemeral,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    runnerGroupId,
    name,
    os,
    status,
    busy,
    listHash(labels),
    ephemeral,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Runner &&
        id == other.id &&
        runnerGroupId == other.runnerGroupId &&
        name == other.name &&
        os == other.os &&
        status == other.status &&
        busy == other.busy &&
        listsEqual(labels, other.labels) &&
        ephemeral == other.ephemeral;
  }
}
