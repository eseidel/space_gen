import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class BranchRestrictionPolicyTeamsInner {
  const BranchRestrictionPolicyTeamsInner({
    this.id,
    this.nodeId,
    this.url,
    this.htmlUrl,
    this.name,
    this.slug,
    this.description,
    this.privacy,
    this.notificationSetting,
    this.permission,
    this.membersUrl,
    this.repositoriesUrl,
    this.parent,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [BranchRestrictionPolicyTeamsInner].
  factory BranchRestrictionPolicyTeamsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'BranchRestrictionPolicyTeamsInner',
      json,
      () => BranchRestrictionPolicyTeamsInner(
        id: json['id'] as int?,
        nodeId: json['node_id'] as String?,
        url: json['url'] as String?,
        htmlUrl: json['html_url'] as String?,
        name: json['name'] as String?,
        slug: json['slug'] as String?,
        description: json['description'] as String?,
        privacy: json['privacy'] as String?,
        notificationSetting: json['notification_setting'] as String?,
        permission: json['permission'] as String?,
        membersUrl: json['members_url'] as String?,
        repositoriesUrl: json['repositories_url'] as String?,
        parent: json['parent'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchRestrictionPolicyTeamsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BranchRestrictionPolicyTeamsInner.fromJson(json);
  }

  final int? id;
  final String? nodeId;
  final String? url;
  final String? htmlUrl;
  final String? name;
  final String? slug;
  final String? description;
  final String? privacy;
  final String? notificationSetting;
  final String? permission;
  final String? membersUrl;
  final String? repositoriesUrl;
  final String? parent;

  /// Converts a [BranchRestrictionPolicyTeamsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (nodeId != null) 'node_id': nodeId,
      if (url != null) 'url': url,
      if (htmlUrl != null) 'html_url': htmlUrl,
      if (name != null) 'name': name,
      if (slug != null) 'slug': slug,
      'description': description,
      if (privacy != null) 'privacy': privacy,
      if (notificationSetting != null)
        'notification_setting': notificationSetting,
      if (permission != null) 'permission': permission,
      if (membersUrl != null) 'members_url': membersUrl,
      if (repositoriesUrl != null) 'repositories_url': repositoriesUrl,
      'parent': parent,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    nodeId,
    url,
    htmlUrl,
    name,
    slug,
    description,
    privacy,
    notificationSetting,
    permission,
    membersUrl,
    repositoriesUrl,
    parent,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchRestrictionPolicyTeamsInner &&
        id == other.id &&
        nodeId == other.nodeId &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        name == other.name &&
        slug == other.slug &&
        description == other.description &&
        privacy == other.privacy &&
        notificationSetting == other.notificationSetting &&
        permission == other.permission &&
        membersUrl == other.membersUrl &&
        repositoriesUrl == other.repositoriesUrl &&
        parent == other.parent;
  }
}
