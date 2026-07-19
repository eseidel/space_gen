import 'package:github/model_helpers.dart';
import 'package:github/models/org_hook_config.dart';
import 'package:meta/meta.dart';

/// {@template org_hook}
/// Org Hook
/// Org Hook
/// {@endtemplate}
@immutable
class OrgHook {
  /// {@macro org_hook}
  const OrgHook({
    required this.id,
    required this.url,
    required this.pingUrl,
    required this.name,
    required this.events,
    required this.active,
    required this.config,
    required this.updatedAt,
    required this.createdAt,
    required this.type,
    this.deliveriesUrl,
  });

  /// Converts a `Map<String, dynamic>` to an [OrgHook].
  factory OrgHook.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'OrgHook',
      json,
      () => OrgHook(
        id: json['id'] as int,
        url: Uri.parse(json['url'] as String),
        pingUrl: Uri.parse(json['ping_url'] as String),
        deliveriesUrl: maybeParseUri(json['deliveries_url'] as String?),
        name: json['name'] as String,
        events: (json['events'] as List).cast<String>(),
        active: json['active'] as bool,
        config: OrgHookConfig.fromJson(json['config'] as Map<String, dynamic>),
        updatedAt: DateTime.parse(json['updated_at'] as String),
        createdAt: DateTime.parse(json['created_at'] as String),
        type: json['type'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static OrgHook? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return OrgHook.fromJson(json);
  }

  /// Example: `1`
  final int id;

  /// Example: `'https://api.github.com/orgs/octocat/hooks/1'`
  final Uri url;

  /// Example: `'https://api.github.com/orgs/octocat/hooks/1/pings'`
  final Uri pingUrl;

  /// Example: `'https://api.github.com/orgs/octocat/hooks/1/deliveries'`
  final Uri? deliveriesUrl;

  /// Example: `'web'`
  final String name;

  /// Example: `'push'`
  /// Example: `'pull_request'`
  final List<String> events;

  /// Example: `true`
  final bool active;
  final OrgHookConfig config;

  /// Example: `'2011-09-06T20:39:23Z'`
  final DateTime updatedAt;

  /// Example: `'2011-09-06T17:26:27Z'`
  final DateTime createdAt;
  final String type;

  /// Converts an [OrgHook] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url.toString(),
      'ping_url': pingUrl.toString(),
      if (deliveriesUrl != null) 'deliveries_url': deliveriesUrl?.toString(),
      'name': name,
      'events': events,
      'active': active,
      'config': config.toJson(),
      'updated_at': updatedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'type': type,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    url,
    pingUrl,
    deliveriesUrl,
    name,
    listHash(events),
    active,
    config,
    updatedAt,
    createdAt,
    type,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is OrgHook &&
        id == other.id &&
        url == other.url &&
        pingUrl == other.pingUrl &&
        deliveriesUrl == other.deliveriesUrl &&
        name == other.name &&
        listsEqual(events, other.events) &&
        active == other.active &&
        config == other.config &&
        updatedAt == other.updatedAt &&
        createdAt == other.createdAt &&
        type == other.type;
  }
}
