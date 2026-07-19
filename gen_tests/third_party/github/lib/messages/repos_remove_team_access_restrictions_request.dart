// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

sealed class ReposRemoveTeamAccessRestrictionsRequest {
  const ReposRemoveTeamAccessRestrictionsRequest();

  factory ReposRemoveTeamAccessRestrictionsRequest.fromJson(dynamic json) {
    return switch (json) {
      final Map<String, dynamic> v =>
        ReposRemoveTeamAccessRestrictionsRequestOneOf0.fromJson(v),
      final List<dynamic> v => ReposRemoveTeamAccessRestrictionsRequestList(
        v.cast<String>(),
      ),
      _ => throw FormatException(
        'Unsupported shape for ReposRemoveTeamAccessRestrictionsRequest: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposRemoveTeamAccessRestrictionsRequest? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ReposRemoveTeamAccessRestrictionsRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class ReposRemoveTeamAccessRestrictionsRequestList
    extends ReposRemoveTeamAccessRestrictionsRequest {
  const ReposRemoveTeamAccessRestrictionsRequestList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposRemoveTeamAccessRestrictionsRequestList &&
        value == other.value;
  }
}

/// Example:
/// ```json
/// {
///   "teams": [
///     "my-team"
///   ]
/// }
/// ```
@immutable
final class ReposRemoveTeamAccessRestrictionsRequestOneOf0
    extends ReposRemoveTeamAccessRestrictionsRequest {
  const ReposRemoveTeamAccessRestrictionsRequestOneOf0({required this.teams});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposRemoveTeamAccessRestrictionsRequestOneOf0].
  factory ReposRemoveTeamAccessRestrictionsRequestOneOf0.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposRemoveTeamAccessRestrictionsRequestOneOf0',
      json,
      () => ReposRemoveTeamAccessRestrictionsRequestOneOf0(
        teams: (json['teams'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposRemoveTeamAccessRestrictionsRequestOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposRemoveTeamAccessRestrictionsRequestOneOf0.fromJson(json);
  }

  /// The slug values for teams
  final List<String> teams;

  /// Converts a [ReposRemoveTeamAccessRestrictionsRequestOneOf0]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {'teams': teams};
  }

  @override
  int get hashCode => listHash(teams).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposRemoveTeamAccessRestrictionsRequestOneOf0 &&
        listsEqual(teams, other.teams);
  }
}
