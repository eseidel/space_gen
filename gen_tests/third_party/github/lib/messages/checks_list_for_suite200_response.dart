import 'package:github/model_helpers.dart';
import 'package:github/models/check_run.dart';
import 'package:meta/meta.dart';

@immutable
class ChecksListForSuite200Response {
  const ChecksListForSuite200Response({
    required this.totalCount,
    required this.checkRuns,
  });

  /// Converts a `Map<String, dynamic>` to a [ChecksListForSuite200Response].
  factory ChecksListForSuite200Response.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ChecksListForSuite200Response',
      json,
      () => ChecksListForSuite200Response(
        totalCount: json['total_count'] as int,
        checkRuns: (json['check_runs'] as List)
            .map<CheckRun>((e) => CheckRun.fromJson(e as Map<String, dynamic>))
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksListForSuite200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChecksListForSuite200Response.fromJson(json);
  }

  final int totalCount;
  final List<CheckRun> checkRuns;

  /// Converts a [ChecksListForSuite200Response] to a `Map<String, dynamic>`.
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
    return other is ChecksListForSuite200Response &&
        totalCount == other.totalCount &&
        listsEqual(checkRuns, other.checkRuns);
  }
}
