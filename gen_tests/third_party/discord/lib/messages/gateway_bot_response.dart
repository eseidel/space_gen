import 'package:discord/messages/gateway_bot_session_start_limit_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GatewayBotResponse {
  const GatewayBotResponse({
    required this.url,
    required this.sessionStartLimit,
    required this.shards,
  });

  /// Converts a `Map<String, dynamic>` to a [GatewayBotResponse].
  factory GatewayBotResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GatewayBotResponse',
      json,
      () => GatewayBotResponse(
        url: Uri.parse(json['url'] as String),
        sessionStartLimit: GatewayBotSessionStartLimitResponse.fromJson(
          json['session_start_limit'] as Map<String, dynamic>,
        ),
        shards: json['shards'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GatewayBotResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GatewayBotResponse.fromJson(json);
  }

  final Uri url;
  final GatewayBotSessionStartLimitResponse sessionStartLimit;
  final int shards;

  /// Converts a [GatewayBotResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'session_start_limit': sessionStartLimit.toJson(),
      'shards': shards,
    };
  }

  @override
  int get hashCode => Object.hashAll([url, sessionStartLimit, shards]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GatewayBotResponse &&
        url == other.url &&
        sessionStartLimit == other.sessionStartLimit &&
        shards == other.shards;
  }
}
