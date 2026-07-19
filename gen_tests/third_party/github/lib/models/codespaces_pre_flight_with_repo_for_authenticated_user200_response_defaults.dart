// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesPreFlightWithRepoForAuthenticatedUser200ResponseDefaults {
  const CodespacesPreFlightWithRepoForAuthenticatedUser200ResponseDefaults({
    required this.location,
    required this.devcontainerPath,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesPreFlightWithRepoForAuthenticatedUser200ResponseDefaults].
  factory CodespacesPreFlightWithRepoForAuthenticatedUser200ResponseDefaults.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesPreFlightWithRepoForAuthenticatedUser200ResponseDefaults',
      json,
      () => CodespacesPreFlightWithRepoForAuthenticatedUser200ResponseDefaults(
        location: json['location'] as String,
        devcontainerPath: checkedKey(json, 'devcontainer_path') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesPreFlightWithRepoForAuthenticatedUser200ResponseDefaults?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CodespacesPreFlightWithRepoForAuthenticatedUser200ResponseDefaults.fromJson(
      json,
    );
  }

  final String location;
  final String? devcontainerPath;

  /// Converts a [CodespacesPreFlightWithRepoForAuthenticatedUser200ResponseDefaults]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'location': location, 'devcontainer_path': devcontainerPath};
  }

  @override
  int get hashCode => Object.hashAll([location, devcontainerPath]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is CodespacesPreFlightWithRepoForAuthenticatedUser200ResponseDefaults &&
        location == other.location &&
        devcontainerPath == other.devcontainerPath;
  }
}
