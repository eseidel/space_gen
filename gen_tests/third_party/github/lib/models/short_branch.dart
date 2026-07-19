import 'package:github/model_helpers.dart';
import 'package:github/models/branch_protection.dart';
import 'package:github/models/short_branch_commit.dart';
import 'package:meta/meta.dart';

/// {@template short_branch}
/// Short Branch
/// Short Branch
/// {@endtemplate}
@immutable
class ShortBranch {
  /// {@macro short_branch}
  const ShortBranch({
    required this.name,
    required this.commit,
    required this.protected,
    this.protection,
    this.protectionUrl,
  });

  /// Converts a `Map<String, dynamic>` to a [ShortBranch].
  factory ShortBranch.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ShortBranch',
      json,
      () => ShortBranch(
        name: json['name'] as String,
        commit: ShortBranchCommit.fromJson(
          json['commit'] as Map<String, dynamic>,
        ),
        protected: json['protected'] as bool,
        protection: BranchProtection.maybeFromJson(
          json['protection'] as Map<String, dynamic>?,
        ),
        protectionUrl: maybeParseUri(json['protection_url'] as String?),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ShortBranch? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ShortBranch.fromJson(json);
  }

  final String name;
  final ShortBranchCommit commit;
  final bool protected;

  /// Branch Protection
  /// Branch Protection
  final BranchProtection? protection;
  final Uri? protectionUrl;

  /// Converts a [ShortBranch] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'commit': commit.toJson(),
      'protected': protected,
      'protection': ?protection?.toJson(),
      'protection_url': ?protectionUrl?.toString(),
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([name, commit, protected, protection, protectionUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ShortBranch &&
        name == other.name &&
        commit == other.commit &&
        protected == other.protected &&
        protection == other.protection &&
        protectionUrl == other.protectionUrl;
  }
}
