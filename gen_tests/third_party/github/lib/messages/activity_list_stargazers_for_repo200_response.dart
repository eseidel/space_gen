// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/models/simple_user.dart';
import 'package:github/models/stargazer.dart';
import 'package:meta/meta.dart';

sealed class ActivityListStargazersForRepo200Response {
  const ActivityListStargazersForRepo200Response();

  factory ActivityListStargazersForRepo200Response.fromJson(dynamic json) {
    final v = json as List;
    if (v.isNotEmpty &&
        (v.first as Map<String, dynamic>).containsKey('avatar_url')) {
      return ActivityListStargazersForRepo200ResponseSimpleUserList(
        v
            .map<SimpleUser>(
              (e) => SimpleUser.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );
    }
    if (v.isNotEmpty && (v.first as Map<String, dynamic>).containsKey('user')) {
      return ActivityListStargazersForRepo200ResponseStargazerList(
        v
            .map<Stargazer>(
              (e) => Stargazer.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );
    }
    throw const FormatException(
      'No variant of ActivityListStargazersForRepo200Response matched first array element',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActivityListStargazersForRepo200Response? maybeFromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return ActivityListStargazersForRepo200Response.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class ActivityListStargazersForRepo200ResponseSimpleUserList
    extends ActivityListStargazersForRepo200Response {
  const ActivityListStargazersForRepo200ResponseSimpleUserList(this.value);

  final List<SimpleUser> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivityListStargazersForRepo200ResponseSimpleUserList &&
        value == other.value;
  }
}

@immutable
final class ActivityListStargazersForRepo200ResponseStargazerList
    extends ActivityListStargazersForRepo200Response {
  const ActivityListStargazersForRepo200ResponseStargazerList(this.value);

  final List<Stargazer> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivityListStargazersForRepo200ResponseStargazerList &&
        value == other.value;
  }
}
