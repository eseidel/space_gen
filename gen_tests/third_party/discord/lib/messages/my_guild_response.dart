import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/guild_features.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class MyGuildResponse {
  MyGuildResponse({
    required this.id,
    required this.name,
    required this.icon,
    required this.banner,
    required this.owner,
    required this.permissions,
    required this.features,
    this.approximateMemberCount,
    this.approximatePresenceCount,
  }) {
    features.validate(unique: true);
  }

  /// Converts a `Map<String, dynamic>` to a [MyGuildResponse].
  factory MyGuildResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MyGuildResponse',
      json,
      () => MyGuildResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
        icon: checkedKey(json, 'icon') as String?,
        banner: checkedKey(json, 'banner') as String?,
        owner: json['owner'] as bool,
        permissions: json['permissions'] as String,
        features: (json['features'] as List)
            .map<GuildFeatures>((e) => GuildFeatures.fromJson(e as String))
            .toList(),
        approximateMemberCount: json['approximate_member_count'] as int?,
        approximatePresenceCount: json['approximate_presence_count'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MyGuildResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return MyGuildResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;
  final String? icon;
  final String? banner;
  final bool owner;
  final String permissions;
  final List<GuildFeatures> features;
  final int? approximateMemberCount;
  final int? approximatePresenceCount;

  /// Converts a [MyGuildResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id.toJson(),
      'name': name,
      'icon': icon,
      'banner': banner,
      'owner': owner,
      'permissions': permissions,
      'features': features.map((e) => e.toJson()).toList(),
      'approximate_member_count': approximateMemberCount,
      'approximate_presence_count': approximatePresenceCount,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    name,
    icon,
    banner,
    owner,
    permissions,
    listHash(features),
    approximateMemberCount,
    approximatePresenceCount,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MyGuildResponse &&
        id == other.id &&
        name == other.name &&
        icon == other.icon &&
        banner == other.banner &&
        owner == other.owner &&
        permissions == other.permissions &&
        listsEqual(features, other.features) &&
        approximateMemberCount == other.approximateMemberCount &&
        approximatePresenceCount == other.approximatePresenceCount;
  }
}
