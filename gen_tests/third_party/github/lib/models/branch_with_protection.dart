import 'package:github/model_helpers.dart';
import 'package:github/models/branch_protection.dart';
import 'package:github/models/branch_with_protection_links.dart';
import 'package:github/models/commit.dart';
import 'package:meta/meta.dart';

/// {@template branch_with_protection}
/// Branch With Protection
/// Branch With Protection
/// {@endtemplate}
@immutable
class BranchWithProtection {
  /// {@macro branch_with_protection}
  const BranchWithProtection({
    required this.name,
    required this.commit,
    required this.links,
    required this.protected,
    required this.protection,
    required this.protectionUrl,
    this.pattern,
    this.requiredApprovingReviewCount,
  });

  /// Converts a `Map<String, dynamic>` to a [BranchWithProtection].
  factory BranchWithProtection.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BranchWithProtection',
      json,
      () => BranchWithProtection(
        name: json['name'] as String,
        commit: Commit.fromJson(json['commit'] as Map<String, dynamic>),
        links: BranchWithProtectionLinks.fromJson(
          json['_links'] as Map<String, dynamic>,
        ),
        protected: json['protected'] as bool,
        protection: BranchProtection.fromJson(
          json['protection'] as Map<String, dynamic>,
        ),
        protectionUrl: Uri.parse(json['protection_url'] as String),
        pattern: json['pattern'] as String?,
        requiredApprovingReviewCount:
            json['required_approving_review_count'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchWithProtection? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return BranchWithProtection.fromJson(json);
  }

  final String name;

  /// Commit
  /// Commit
  final Commit commit;
  final BranchWithProtectionLinks links;
  final bool protected;

  /// Branch Protection
  /// Branch Protection
  final BranchProtection protection;
  final Uri protectionUrl;

  /// Example: `'"mas*"'`
  final String? pattern;

  /// Example: `1`
  final int? requiredApprovingReviewCount;

  /// Converts a [BranchWithProtection] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'commit': commit.toJson(),
      '_links': links.toJson(),
      'protected': protected,
      'protection': protection.toJson(),
      'protection_url': protectionUrl.toString(),
      if (pattern != null) 'pattern': pattern,
      if (requiredApprovingReviewCount != null)
        'required_approving_review_count': requiredApprovingReviewCount,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    name,
    commit,
    links,
    protected,
    protection,
    protectionUrl,
    pattern,
    requiredApprovingReviewCount,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchWithProtection &&
        name == other.name &&
        commit == other.commit &&
        links == other.links &&
        protected == other.protected &&
        protection == other.protection &&
        protectionUrl == other.protectionUrl &&
        pattern == other.pattern &&
        requiredApprovingReviewCount == other.requiredApprovingReviewCount;
  }
}
