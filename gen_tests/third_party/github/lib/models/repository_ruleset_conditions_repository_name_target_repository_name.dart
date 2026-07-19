// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRulesetConditionsRepositoryNameTargetRepositoryName {
  const RepositoryRulesetConditionsRepositoryNameTargetRepositoryName({
    this.include,
    this.exclude,
    this.protected,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRulesetConditionsRepositoryNameTargetRepositoryName].
  factory RepositoryRulesetConditionsRepositoryNameTargetRepositoryName.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRulesetConditionsRepositoryNameTargetRepositoryName',
      json,
      () => RepositoryRulesetConditionsRepositoryNameTargetRepositoryName(
        include: (json['include'] as List?)?.cast<String>(),
        exclude: (json['exclude'] as List?)?.cast<String>(),
        protected: json['protected'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRulesetConditionsRepositoryNameTargetRepositoryName?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetConditionsRepositoryNameTargetRepositoryName.fromJson(
      json,
    );
  }

  /// Array of repository names or patterns to include. One of these patterns
  /// must match for the condition to pass. Also accepts `~ALL` to include all
  /// repositories.
  final List<String>? include;

  /// Array of repository names or patterns to exclude. The condition will not
  /// pass if any of these patterns match.
  final List<String>? exclude;

  /// Whether renaming of target repositories is prevented.
  final bool? protected;

  /// Converts a [RepositoryRulesetConditionsRepositoryNameTargetRepositoryName]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'include': ?include, 'exclude': ?exclude, 'protected': ?protected};
  }

  @override
  int get hashCode =>
      Object.hashAll([listHash(include), listHash(exclude), protected]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is RepositoryRulesetConditionsRepositoryNameTargetRepositoryName &&
        listsEqual(include, other.include) &&
        listsEqual(exclude, other.exclude) &&
        protected == other.protected;
  }
}
