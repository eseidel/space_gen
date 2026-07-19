// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/models/repository.dart';
import 'package:github/models/starred_repository.dart';
import 'package:meta/meta.dart';

sealed class ActivityListReposStarredByUser200Response {
  const ActivityListReposStarredByUser200Response();

  factory ActivityListReposStarredByUser200Response.fromJson(dynamic json) {
    final v = json as List;
    if (v.isNotEmpty && (v.first as Map<String, dynamic>).containsKey('repo')) {
      return ActivityListReposStarredByUser200ResponseStarredRepositoryList(
        v
            .map<StarredRepository>(
              (e) => StarredRepository.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );
    }
    if (v.isNotEmpty &&
        (v.first as Map<String, dynamic>).containsKey('archive_url')) {
      return ActivityListReposStarredByUser200ResponseRepositoryList(
        v
            .map<Repository>(
              (e) => Repository.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
      );
    }
    throw const FormatException(
      'No variant of ActivityListReposStarredByUser200Response matched first array element',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ActivityListReposStarredByUser200Response? maybeFromJson(
    dynamic json,
  ) {
    if (json == null) {
      return null;
    }
    return ActivityListReposStarredByUser200Response.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  dynamic toJson();
}

@immutable
final class ActivityListReposStarredByUser200ResponseStarredRepositoryList
    extends ActivityListReposStarredByUser200Response {
  const ActivityListReposStarredByUser200ResponseStarredRepositoryList(
    this.value,
  );

  final List<StarredRepository> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is ActivityListReposStarredByUser200ResponseStarredRepositoryList &&
        value == other.value;
  }
}

@immutable
final class ActivityListReposStarredByUser200ResponseRepositoryList
    extends ActivityListReposStarredByUser200Response {
  const ActivityListReposStarredByUser200ResponseRepositoryList(this.value);

  final List<Repository> value;

  @override
  dynamic toJson() => value.map((e) => e.toJson()).toList();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ActivityListReposStarredByUser200ResponseRepositoryList &&
        value == other.value;
  }
}
