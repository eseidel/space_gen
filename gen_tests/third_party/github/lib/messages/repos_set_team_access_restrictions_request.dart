// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

sealed class ReposSetTeamAccessRestrictionsRequest {
  const ReposSetTeamAccessRestrictionsRequest();

  factory ReposSetTeamAccessRestrictionsRequest.fromJson(dynamic json) {
    return switch (json) {
      final Map<String, dynamic> v =>
        ReposSetTeamAccessRestrictionsRequestOneOf0.fromJson(v),
      final List<dynamic> v => ReposSetTeamAccessRestrictionsRequestList(
        v.cast<String>(),
      ),
      _ => throw FormatException(
        'Unsupported shape for ReposSetTeamAccessRestrictionsRequest: ${json.runtimeType}',
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposSetTeamAccessRestrictionsRequest? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ReposSetTeamAccessRestrictionsRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class ReposSetTeamAccessRestrictionsRequestList
    extends ReposSetTeamAccessRestrictionsRequest {
  const ReposSetTeamAccessRestrictionsRequestList(this.value);

  final List<String> value;

  @override
  dynamic toJson() => value;

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposSetTeamAccessRestrictionsRequestList &&
        value == other.value;
  }
}

/// Example:
/// ```json
/// {
///   "teams": [
///     "justice-league"
///   ]
/// }
/// ```
@immutable
final class ReposSetTeamAccessRestrictionsRequestOneOf0
    extends ReposSetTeamAccessRestrictionsRequest {
  const ReposSetTeamAccessRestrictionsRequestOneOf0({required this.teams});

  /// Converts a `Map<String, dynamic>` to a
  /// [ReposSetTeamAccessRestrictionsRequestOneOf0].
  factory ReposSetTeamAccessRestrictionsRequestOneOf0.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ReposSetTeamAccessRestrictionsRequestOneOf0',
      json,
      () => ReposSetTeamAccessRestrictionsRequestOneOf0(
        teams: (json['teams'] as List).cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposSetTeamAccessRestrictionsRequestOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposSetTeamAccessRestrictionsRequestOneOf0.fromJson(json);
  }

  /// The slug values for teams
  final List<String> teams;

  /// Converts a [ReposSetTeamAccessRestrictionsRequestOneOf0]
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
    return other is ReposSetTeamAccessRestrictionsRequestOneOf0 &&
        listsEqual(teams, other.teams);
  }
}
