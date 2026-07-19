import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleFileExtensionRestrictionParameters {
  const RepositoryRuleFileExtensionRestrictionParameters({
    required this.restrictedFileExtensions,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRuleFileExtensionRestrictionParameters].
  factory RepositoryRuleFileExtensionRestrictionParameters.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRuleFileExtensionRestrictionParameters',
      json,
      () => RepositoryRuleFileExtensionRestrictionParameters(
        restrictedFileExtensions: (json['restricted_file_extensions'] as List)
            .cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleFileExtensionRestrictionParameters? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleFileExtensionRestrictionParameters.fromJson(json);
  }

  /// The file extensions that are restricted from being pushed to the commit
  /// graph.
  final List<String> restrictedFileExtensions;

  /// Converts a [RepositoryRuleFileExtensionRestrictionParameters]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'restricted_file_extensions': restrictedFileExtensions};
  }

  @override
  int get hashCode => listHash(restrictedFileExtensions).hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleFileExtensionRestrictionParameters &&
        listsEqual(restrictedFileExtensions, other.restrictedFileExtensions);
  }
}
