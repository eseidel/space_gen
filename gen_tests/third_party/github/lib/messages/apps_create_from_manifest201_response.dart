// Spec descriptions copy prose verbatim into dartdoc, where `[x]`
// inside a sentence (placeholder text, ALL_CAPS tokens, license
// templates) is parsed as a symbol reference even when no such
// symbol exists. Suppress file-locally so the lint stays live
// elsewhere; spec authors do not always escape brackets.
// ignore_for_file: comment_references
import 'package:github/model_helpers.dart';
import 'package:github/models/integration_owner.dart';
import 'package:github/models/integration_permissions.dart';
import 'package:meta/meta.dart';

@immutable
class AppsCreateFromManifest201Response {
  const AppsCreateFromManifest201Response({
    required this.id,
    required this.nodeId,
    required this.clientId,
    required this.owner,
    required this.name,
    required this.description,
    required this.externalUrl,
    required this.htmlUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.permissions,
    required this.events,
    required this.clientSecret,
    required this.webhookSecret,
    required this.pem,
    required this.entries,
    this.slug,
    this.installationsCount,
  });

  /// Converts a `Map<String, dynamic>` to an
  /// [AppsCreateFromManifest201Response].
  factory AppsCreateFromManifest201Response.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'AppsCreateFromManifest201Response',
      json,
      () => AppsCreateFromManifest201Response(
        id: json['id'] as int,
        slug: json['slug'] as String?,
        nodeId: json['node_id'] as String,
        clientId: json['client_id'] as String,
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
        clientSecret: json['client_secret'] as String,
        webhookSecret: checkedKey(json, 'webhook_secret') as String?,
        pem: json['pem'] as String,
        entries: <String, dynamic>{
          for (final entry in json.entries)
            if (!const {
              'id',
              'slug',
              'node_id',
              'client_id',
              'owner',
              'name',
              'description',
              'external_url',
              'html_url',
              'created_at',
              'updated_at',
              'permissions',
              'events',
              'installations_count',
              'client_secret',
              'webhook_secret',
              'pem',
            }.contains(entry.key))
              entry.key: entry.value,
        },
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static AppsCreateFromManifest201Response? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return AppsCreateFromManifest201Response.fromJson(json);
  }

  /// Unique identifier of the GitHub app
  /// Example: `37`
  final int id;

  /// The slug name of the GitHub app
  /// Example: `'probot-owners'`
  final String? slug;

  /// Example: `'MDExOkludGVncmF0aW9uMQ=='`
  final String nodeId;
  final String clientId;
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
  final String clientSecret;
  final String? webhookSecret;
  final String pem;
  final Map<String, dynamic> entries;

  /// Indexes this object by JSON key: a key that names a declared property
  /// returns that property's value; any other key reads from
  /// [entries]. The return type is the tightest that
  /// covers every named property and the overflow value type.
  Object? operator [](String key) => switch (key) {
    'id' => id,
    'slug' => slug,
    'node_id' => nodeId,
    'client_id' => clientId,
    'owner' => owner,
    'name' => name,
    'description' => description,
    'external_url' => externalUrl,
    'html_url' => htmlUrl,
    'created_at' => createdAt,
    'updated_at' => updatedAt,
    'permissions' => permissions,
    'events' => events,
    'installations_count' => installationsCount,
    'client_secret' => clientSecret,
    'webhook_secret' => webhookSecret,
    'pem' => pem,
    _ => entries[key],
  };

  /// Converts an [AppsCreateFromManifest201Response]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'slug': ?slug,
      'node_id': nodeId,
      'client_id': clientId,
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
      'client_secret': clientSecret,
      'webhook_secret': webhookSecret,
      'pem': pem,
      for (final entry in entries.entries)
        if (!const {
          'id',
          'slug',
          'node_id',
          'client_id',
          'owner',
          'name',
          'description',
          'external_url',
          'html_url',
          'created_at',
          'updated_at',
          'permissions',
          'events',
          'installations_count',
          'client_secret',
          'webhook_secret',
          'pem',
        }.contains(entry.key))
          entry.key: entry.value,
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
    clientSecret,
    webhookSecret,
    pem,
    mapHash(entries),
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AppsCreateFromManifest201Response &&
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
        installationsCount == other.installationsCount &&
        clientSecret == other.clientSecret &&
        webhookSecret == other.webhookSecret &&
        pem == other.pem &&
        mapsEqual(entries, other.entries);
  }
}
