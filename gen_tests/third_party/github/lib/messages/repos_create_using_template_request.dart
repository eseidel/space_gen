import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateUsingTemplateRequest {
  const ReposCreateUsingTemplateRequest({
    required this.name,
    this.owner,
    this.description,
    this.includeAllBranches = false,
    this.private = false,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposCreateUsingTemplateRequest].
  factory ReposCreateUsingTemplateRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposCreateUsingTemplateRequest',
      json,
      () => ReposCreateUsingTemplateRequest(
        owner: json['owner'] as String?,
        name: json['name'] as String,
        description: json['description'] as String?,
        includeAllBranches: (json['include_all_branches'] as bool?) ?? false,
        private: (json['private'] as bool?) ?? false,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateUsingTemplateRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ReposCreateUsingTemplateRequest.fromJson(json);
  }

  /// The organization or person who will own the new repository. To create a
  /// new repository in an organization, the authenticated user must be a
  /// member of the specified organization.
  final String? owner;

  /// The name of the new repository.
  final String name;

  /// A short description of the new repository.
  final String? description;

  /// Set to `true` to include the directory structure and files from all
  /// branches in the template repository, and not just the default branch.
  /// Default: `false`.
  final bool includeAllBranches;

  /// Either `true` to create a new private repository or `false` to create a
  /// new public one.
  final bool private;

  /// Converts a [ReposCreateUsingTemplateRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (owner != null) 'owner': owner,
      'name': name,
      if (description != null) 'description': description,
      'include_all_branches': includeAllBranches,
      'private': private,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([owner, name, description, includeAllBranches, private]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateUsingTemplateRequest &&
        owner == other.owner &&
        name == other.name &&
        description == other.description &&
        includeAllBranches == other.includeAllBranches &&
        private == other.private;
  }
}
