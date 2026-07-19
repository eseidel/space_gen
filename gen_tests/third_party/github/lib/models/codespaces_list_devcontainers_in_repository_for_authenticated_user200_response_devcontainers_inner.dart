// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesListDevcontainersInRepositoryForAuthenticatedUser200ResponseDevcontainersInner {
  const CodespacesListDevcontainersInRepositoryForAuthenticatedUser200ResponseDevcontainersInner({
    required this.path,
    this.name,
    this.displayName,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesListDevcontainersInRepositoryForAuthenticatedUser200ResponseDevcontainersInner].
  factory CodespacesListDevcontainersInRepositoryForAuthenticatedUser200ResponseDevcontainersInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesListDevcontainersInRepositoryForAuthenticatedUser200ResponseDevcontainersInner',
      json,
      () =>
          CodespacesListDevcontainersInRepositoryForAuthenticatedUser200ResponseDevcontainersInner(
            path: json['path'] as String,
            name: json['name'] as String?,
            displayName: json['display_name'] as String?,
          ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesListDevcontainersInRepositoryForAuthenticatedUser200ResponseDevcontainersInner?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespacesListDevcontainersInRepositoryForAuthenticatedUser200ResponseDevcontainersInner.fromJson(
      json,
    );
  }

  final String path;
  final String? name;
  final String? displayName;

  /// Converts a [CodespacesListDevcontainersInRepositoryForAuthenticatedUser200ResponseDevcontainersInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'path': path,
      if (name != null) 'name': name,
      if (displayName != null) 'display_name': displayName,
    };
  }

  @override
  int get hashCode => Object.hashAll([path, name, displayName]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodespacesListDevcontainersInRepositoryForAuthenticatedUser200ResponseDevcontainersInner &&
        path == other.path &&
        name == other.name &&
        displayName == other.displayName;
  }
}
