// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

sealed class ReposAddTeamAccessRestrictionsRequest {
  const ReposAddTeamAccessRestrictionsRequest();

  factory ReposAddTeamAccessRestrictionsRequest.fromJson(dynamic json) {
    return switch (json) {
      final Map<String, dynamic> v =>
        ReposAddTeamAccessRestrictionsRequestOneOf0.fromJson(v),
      final List<dynamic> v => ReposAddTeamAccessRestrictionsRequestList(
        v.cast<String>(),
      ),
      _ => throw FormatException(
        'Unsupported shape for ReposAddTeamAccessRestrictionsRequest: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposAddTeamAccessRestrictionsRequest? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ReposAddTeamAccessRestrictionsRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class ReposAddTeamAccessRestrictionsRequestList
    extends ReposAddTeamAccessRestrictionsRequest {
  const ReposAddTeamAccessRestrictionsRequestList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposAddTeamAccessRestrictionsRequestList &&
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
final class ReposAddTeamAccessRestrictionsRequestOneOf0
    extends ReposAddTeamAccessRestrictionsRequest {
  const ReposAddTeamAccessRestrictionsRequestOneOf0({required this.teams});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposAddTeamAccessRestrictionsRequestOneOf0].
  factory ReposAddTeamAccessRestrictionsRequestOneOf0.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposAddTeamAccessRestrictionsRequestOneOf0',
      json,
      () => ReposAddTeamAccessRestrictionsRequestOneOf0(
        teams: (json['teams'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposAddTeamAccessRestrictionsRequestOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposAddTeamAccessRestrictionsRequestOneOf0.fromJson(json);
  }

  /// The slug values for teams
  final List<String> teams;

  /// Converts a [ReposAddTeamAccessRestrictionsRequestOneOf0]
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
    return other is ReposAddTeamAccessRestrictionsRequestOneOf0 &&
        listsEqual(teams, other.teams);
  }
}
