import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class SelectedActions {
  const SelectedActions({
    this.githubOwnedAllowed,
    this.verifiedAllowed,
    this.patternsAllowed,
  });

  /// Converts a `Map<String, dynamic>` to a [SelectedActions].
  factory SelectedActions.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SelectedActions',
      json,
      () => SelectedActions(
        githubOwnedAllowed: json['github_owned_allowed'] as bool?,
        verifiedAllowed: json['verified_allowed'] as bool?,
        patternsAllowed: (json['patterns_allowed'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SelectedActions? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SelectedActions.fromJson(json);
  }

  /// Whether GitHub-owned actions are allowed. For example, this includes the
  /// actions in the `actions` organization.
  final bool? githubOwnedAllowed;

  /// Whether actions from GitHub Marketplace verified creators are allowed.
  /// Set to `true` to allow all actions by GitHub Marketplace verified
  /// creators.
  final bool? verifiedAllowed;

  /// Specifies a list of string-matching patterns to allow specific action(s)
  /// and reusable workflow(s). Wildcards, tags, and SHAs are allowed. For
  /// example, `monalisa/octocat@*`, `monalisa/octocat@v2`, `monalisa/*`.
  ///
  /// > [!NOTE]
  /// > The `patterns_allowed` setting only applies to public repositories.
  final List<String>? patternsAllowed;

  /// Converts a [SelectedActions] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (githubOwnedAllowed != null)
        'github_owned_allowed': githubOwnedAllowed,
      if (verifiedAllowed != null) 'verified_allowed': verifiedAllowed,
      if (patternsAllowed != null) 'patterns_allowed': patternsAllowed,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    githubOwnedAllowed,
    verifiedAllowed,
    listHash(patternsAllowed),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SelectedActions &&
        githubOwnedAllowed == other.githubOwnedAllowed &&
        verifiedAllowed == other.verifiedAllowed &&
        listsEqual(patternsAllowed, other.patternsAllowed);
  }
}
