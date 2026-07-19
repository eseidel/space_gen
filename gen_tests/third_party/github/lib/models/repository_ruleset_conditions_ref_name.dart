import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRulesetConditionsRefName {
  const RepositoryRulesetConditionsRefName({this.include, this.exclude});

  /// Converts a `Map<String, dynamic>` to a
  /// [RepositoryRulesetConditionsRefName].
  factory RepositoryRulesetConditionsRefName.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'RepositoryRulesetConditionsRefName',
      json,
      () => RepositoryRulesetConditionsRefName(
        include: (json['include'] as List?)?.cast<String>(),
        exclude: (json['exclude'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRulesetConditionsRefName? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRulesetConditionsRefName.fromJson(json);
  }

  /// Array of ref names or patterns to include. One of these patterns must
  /// match for the condition to pass. Also accepts `~DEFAULT_BRANCH` to
  /// include the default branch or `~ALL` to include all branches.
  final List<String>? include;

  /// Array of ref names or patterns to exclude. The condition will not pass
  /// if any of these patterns match.
  final List<String>? exclude;

  /// Converts a [RepositoryRulesetConditionsRefName]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'include': include, 'exclude': exclude};
  }

  @override
  int get hashCode => Object.hashAll([listHash(include), listHash(exclude)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRulesetConditionsRefName &&
        listsEqual(include, other.include) &&
        listsEqual(exclude, other.exclude);
  }
}
