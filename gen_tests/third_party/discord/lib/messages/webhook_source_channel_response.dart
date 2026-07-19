import 'package:discord/model_helpers.dart';
import 'package:discord/models/snowflake_type.dart';
import 'package:meta/meta.dart';

@immutable
class WebhookSourceChannelResponse {
  const WebhookSourceChannelResponse({required this.id, required this.name});

  /// Converts a `Map<String, dynamic>` to a [WebhookSourceChannelResponse].
  factory WebhookSourceChannelResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'WebhookSourceChannelResponse',
      json,
      () => WebhookSourceChannelResponse(
        id: SnowflakeType.fromJson(json['id'] as String),
        name: json['name'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static WebhookSourceChannelResponse? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return WebhookSourceChannelResponse.fromJson(json);
  }

  final SnowflakeType id;
  final String name;

  /// Converts a [WebhookSourceChannelResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'id': id.toJson(), 'name': name};
  }

  @override
  int get hashCode => Object.hashAll([id, name]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is WebhookSourceChannelResponse &&
        id == other.id &&
        name == other.name;
  }
}
