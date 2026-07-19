import 'package:github/model_helpers.dart';
import 'package:github/models/check_suite.dart';
import 'package:meta/meta.dart';

@immutable
class ChecksListSuitesForRef200Response {
  const ChecksListSuitesForRef200Response({
    required this.totalCount,
    required this.checkSuites,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ChecksListSuitesForRef200Response].
  factory ChecksListSuitesForRef200Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ChecksListSuitesForRef200Response',
      json,
      () => ChecksListSuitesForRef200Response(
        totalCount: json['total_count'] as int,
        checkSuites: (json['check_suites'] as List)
            .map<CheckSuite>(
              (e) => CheckSuite.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksListSuitesForRef200Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChecksListSuitesForRef200Response.fromJson(json);
  }

  final int totalCount;
  final List<CheckSuite> checkSuites;

  /// Converts a [ChecksListSuitesForRef200Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'total_count': totalCount,
      'check_suites': checkSuites.map((e) => e.toJson()).toList(),
    };
  }

  @override
  int get hashCode => Object.hashAll([totalCount, listHash(checkSuites)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChecksListSuitesForRef200Response &&
        totalCount == other.totalCount &&
        listsEqual(checkSuites, other.checkSuites);
  }
}
