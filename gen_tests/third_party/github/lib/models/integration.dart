import 'package:github/model_helpers.dart';
import 'package:github/models/integration_owner.dart';
import 'package:github/models/integration_permissions.dart';
import 'package:meta/meta.dart';

/// {@template integration}
/// GitHub app
/// GitHub apps are a new way to extend GitHub. They can be installed directly
/// on organizations and user accounts and granted access to specific
/// repositories. They come with granular permissions and built-in webhooks.
/// GitHub apps are first class actors within GitHub.
/// {@endtemplate}
@immutable
class Integration {
  /// {@macro integration}
  const Integration({
    required this.id,
    required this.nodeId,
    required this.owner,
    required this.name,
    required this.description,
    required this.externalUrl,
    required this.htmlUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.permissions,
    required this.events,
    this.slug,
    this.clientId,
    this.installationsCount,
  });

  /// Converts a `Map<String, dynamic>` to an [Integration].
  factory Integration.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Integration',
      json,
      () => Integration(
        id: json['id'] as int,
        slug: json['slug'] as String?,
        nodeId: json['node_id'] as String,
        clientId: json['client_id'] as String?,
        owner: IntegrationOwner.fromJson(json['owner'] as Map<String, dynamic>),
        name: json['name'] as String,
        description: checkedKey(json, 'description') as String?,
        externalUrl: Uri.parse(json['external_url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        permissions: IntegrationPermissions.fromJson(
          json['permissions'] as Map<String, dynamic>,
        ),
        events: (json['events'] as List).cast<String>(),
        installationsCount: json['installations_count'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Integration? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Integration.fromJson(json);
  }

  /// Unique identifier of the GitHub app
  /// Example: `37`
  final int id;

  /// The slug name of the GitHub app
  /// Example: `'probot-owners'`
  final String? slug;

  /// Example: `'MDExOkludGVncmF0aW9uMQ=='`
  final String nodeId;

  /// Example: `'"Iv1.25b5d1e65ffc4022"'`
  final String? clientId;
  final IntegrationOwner owner;

  /// The name of the GitHub app
  /// Example: `'Probot Owners'`
  final String name;

  /// Example: `'The description of the app.'`
  final String? description;

  /// Example: `'https://example.com'`
  final Uri externalUrl;

  /// Example: `'https://github.com/apps/super-ci'`
  final Uri htmlUrl;

  /// Example: `'2017-07-08T16:18:44-04:00'`
  final DateTime createdAt;

  /// Example: `'2017-07-08T16:18:44-04:00'`
  final DateTime updatedAt;

  /// The set of permissions for the GitHub app
  /// Example:
  /// ```json
  /// {
  ///   "issues": "read",
  ///   "deployments": "write"
  /// }
  /// ```
  final IntegrationPermissions permissions;

  /// The list of events for the GitHub app. Note that the
  /// `installation_target`, `security_advisory`, and `meta` events are not
  /// included because they are global events and not specific to an
  /// installation.
  /// Example: `'label'`
  /// Example: `'deployment'`
  final List<String> events;

  /// The number of installations associated with the GitHub app. Only
  /// returned when the integration is requesting details about itself.
  /// Example: `5`
  final int? installationsCount;

  /// Converts an [Integration] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': ?slug,
      'node_id': nodeId,
      'client_id': ?clientId,
      'owner': owner.toJson(),
      'name': name,
      'description': description,
      'external_url': externalUrl.toString(),
      'html_url': htmlUrl.toString(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'permissions': permissions.toJson(),
      'events': events,
      'installations_count': ?installationsCount,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    slug,
    nodeId,
    clientId,
    owner,
    name,
    description,
    externalUrl,
    htmlUrl,
    createdAt,
    updatedAt,
    permissions,
    listHash(events),
    installationsCount,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Integration &&
        id == other.id &&
        slug == other.slug &&
        nodeId == other.nodeId &&
        clientId == other.clientId &&
        owner == other.owner &&
        name == other.name &&
        description == other.description &&
        externalUrl == other.externalUrl &&
        htmlUrl == other.htmlUrl &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        permissions == other.permissions &&
        listsEqual(events, other.events) &&
        installationsCount == other.installationsCount;
  }
}
