import 'package:github/model_helpers.dart';
import 'package:github/models/check_run.dart';
import 'package:meta/meta.dart';

@immutable
class ChecksListForRef200Response {
  const ChecksListForRef200Response({
    required this.totalCount,
    required this.checkRuns,
  });

  /// Converts a `Map<String, dynamic>` to a [ChecksListForRef200Response].
  factory ChecksListForRef200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ChecksListForRef200Response',
      json,
      () => ChecksListForRef200Response(
        totalCount: json['total_count'] as int,
        checkRuns: (json['check_runs'] as List)
            .map<CheckRun>((e) => CheckRun.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksListForRef200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChecksListForRef200Response.fromJson(json);
  }

  final int totalCount;
  final List<CheckRun> checkRuns;

  /// Converts a [ChecksListForRef200Response] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'check_runs': checkRuns.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(checkRuns)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChecksListForRef200Response &&
        totalCount == other.totalCount &&
        listsEqual(checkRuns, other.checkRuns);
  }
}
