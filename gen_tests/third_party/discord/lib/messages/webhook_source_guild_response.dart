import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class WebhookSourceGuildResponse {
  const WebhookSourceGuildResponse({
    required this.id,
    required this.icon,
    required this.name,
  });

  /// Converts a `Map<String, dynamic>` to a [WebhookSourceGuildResponse].
  factory WebhookSourceGuildResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WebhookSourceGuildResponse',
      json,
      () => WebhookSourceGuildResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        icon: checkedKey(json, 'icon') as String?,
        name: json['name'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WebhookSourceGuildResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return WebhookSourceGuildResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String? icon;
  final String name;

  /// Converts a [WebhookSourceGuildResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id.toJson(), 'icon': icon, 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([id, icon, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WebhookSourceGuildResponse &&
        id == other.id &&
        icon == other.icon &&
        name == other.name;
  }
}
