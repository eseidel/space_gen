import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleFilePathRestrictionParameters {
  const RepositoryRuleFilePathRestrictionParameters({
    required this.restrictedFilePaths,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleFilePathRestrictionParameters].
  factory RepositoryRuleFilePathRestrictionParameters.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleFilePathRestrictionParameters',
      json,
      () => RepositoryRuleFilePathRestrictionParameters(
        restrictedFilePaths: (json['restricted_file_paths'] as List)
            .cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleFilePathRestrictionParameters? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleFilePathRestrictionParameters.fromJson(json);
  }

  /// The file paths that are restricted from being pushed to the commit
  /// graph.
  final List<String> restrictedFilePaths;

  /// Converts a [RepositoryRuleFilePathRestrictionParameters]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'restricted_file_paths': restrictedFilePaths};
  }

  @override
  int get hashCode => listHash(restrictedFilePaths).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleFilePathRestrictionParameters &&
        listsEqual(restrictedFilePaths, other.restrictedFilePaths);
  }
}
