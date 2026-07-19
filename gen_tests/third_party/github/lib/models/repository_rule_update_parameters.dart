import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RepositoryRuleUpdateParameters {
  const RepositoryRuleUpdateParameters({
    required this.updateAllowsFetchAndMerge,
  });

  /// Converts a `Map<String, dynamic>` to a [RepositoryRuleUpdateParameters].
  factory RepositoryRuleUpdateParameters.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RepositoryRuleUpdateParameters',
      json,
      () => RepositoryRuleUpdateParameters(
        updateAllowsFetchAndMerge:
            json['update_allows_fetch_and_merge'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RepositoryRuleUpdateParameters? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return RepositoryRuleUpdateParameters.fromJson(json);
  }

  /// Branch can pull changes from its upstream repository
  final bool updateAllowsFetchAndMerge;

  /// Converts a [RepositoryRuleUpdateParameters] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'update_allows_fetch_and_merge': updateAllowsFetchAndMerge};
  }

  @override
  int get hashCode => updateAllowsFetchAndMerge.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RepositoryRuleUpdateParameters &&
        updateAllowsFetchAndMerge == other.updateAllowsFetchAndMerge;
  }
}
