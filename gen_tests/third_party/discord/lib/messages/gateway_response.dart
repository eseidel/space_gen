import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class GatewayResponse {
  const GatewayResponse({required this.url});

  /// Converts a `Map<String, dynamic>` to a [GatewayResponse].
  factory GatewayResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'GatewayResponse',
      json,
      () => GatewayResponse(url: Uri.parse(json['url'] as String)),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static GatewayResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return GatewayResponse.fromJson(json);
  }

  final Uri url;

  /// Converts a [GatewayResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'url': url.toString()};
  }

  @override
  int get hashCode => url.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is GatewayResponse && url == other.url;
  }
}
