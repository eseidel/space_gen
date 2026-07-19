import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateForkRequest {
  const ReposCreateForkRequest({
    this.organization,
    this.name,
    this.defaultBranchOnly,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposCreateForkRequest].
  factory ReposCreateForkRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposCreateForkRequest',
      json,
      () => ReposCreateForkRequest(
        organization: json['organization'] as String?,
        name: json['name'] as String?,
        defaultBranchOnly: json['default_branch_only'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateForkRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateForkRequest.fromJson(json);
  }

  /// Optional parameter to specify the organization name if forking into an
  /// organization.
  final String? organization;

  /// When forking from an existing repository, a new name for the fork.
  final String? name;

  /// When forking from an existing repository, fork with only the default
  /// branch.
  final bool? defaultBranchOnly;

  /// Converts a [ReposCreateForkRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (organization != null) 'organization': organization,
      if (name != null) 'name': name,
      if (defaultBranchOnly != null) 'default_branch_only': defaultBranchOnly,
    };
  }

  @override
  int get hashCode => Object.hashAll([organization, name, defaultBranchOnly]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateForkRequest &&
        organization == other.organization &&
        name == other.name &&
        defaultBranchOnly == other.defaultBranchOnly;
  }
}
