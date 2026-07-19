import 'package:github/model_helpers.dart';
import 'package:github/models/branch_restriction_policy_apps_inner_owner.dart';
import 'package:github/models/branch_restriction_policy_apps_inner_permissions.dart';
import 'package:meta/meta.dart';

@immutable
class BranchRestrictionPolicyAppsInner {
  const BranchRestrictionPolicyAppsInner({
    this.id,
    this.slug,
    this.nodeId,
    this.owner,
    this.name,
    this.clientId,
    this.description,
    this.externalUrl,
    this.htmlUrl,
    this.createdAt,
    this.updatedAt,
    this.permissions,
    this.events,
  });

  /// Converts a `Map<String, dynamic>` to a [BranchRestrictionPolicyAppsInner].
  factory BranchRestrictionPolicyAppsInner.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'BranchRestrictionPolicyAppsInner',
      json,
      () => BranchRestrictionPolicyAppsInner(
        id: json['id'] as int?,
        slug: json['slug'] as String?,
        nodeId: json['node_id'] as String?,
        owner: BranchRestrictionPolicyAppsInnerOwner.maybeFromJson(
          json['owner'] as Map<String, dynamic>?,
        ),
        name: json['name'] as String?,
        clientId: json['client_id'] as String?,
        description: json['description'] as String?,
        externalUrl: json['external_url'] as String?,
        htmlUrl: json['html_url'] as String?,
        createdAt: json['created_at'] as String?,
        updatedAt: json['updated_at'] as String?,
        permissions: BranchRestrictionPolicyAppsInnerPermissions.maybeFromJson(
          json['permissions'] as Map<String, dynamic>?,
        ),
        events: (json['events'] as List?)?.cast<String>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BranchRestrictionPolicyAppsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BranchRestrictionPolicyAppsInner.fromJson(json);
  }

  final int? id;
  final String? slug;
  final String? nodeId;
  final BranchRestrictionPolicyAppsInnerOwner? owner;
  final String? name;
  final String? clientId;
  final String? description;
  final String? externalUrl;
  final String? htmlUrl;
  final String? createdAt;
  final String? updatedAt;
  final BranchRestrictionPolicyAppsInnerPermissions? permissions;
  final List<String>? events;

  /// Converts a [BranchRestrictionPolicyAppsInner] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': ?id,
      'slug': ?slug,
      'node_id': ?nodeId,
      'owner': ?owner?.toJson(),
      'name': ?name,
      'client_id': ?clientId,
      'description': ?description,
      'external_url': ?externalUrl,
      'html_url': ?htmlUrl,
      'created_at': ?createdAt,
      'updated_at': ?updatedAt,
      'permissions': ?permissions?.toJson(),
      'events': ?events,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    slug,
    nodeId,
    owner,
    name,
    clientId,
    description,
    externalUrl,
    htmlUrl,
    createdAt,
    updatedAt,
    permissions,
    listHash(events),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BranchRestrictionPolicyAppsInner &&
        id == other.id &&
        slug == other.slug &&
        nodeId == other.nodeId &&
        owner == other.owner &&
        name == other.name &&
        clientId == other.clientId &&
        description == other.description &&
        externalUrl == other.externalUrl &&
        htmlUrl == other.htmlUrl &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        permissions == other.permissions &&
        listsEqual(events, other.events);
  }
}
