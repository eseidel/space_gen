// Some public members in this file have no doc comment: doc comments
// are copied from spec descriptions, and not every member has one.
// Suppress file-locally so the lint stays live elsewhere.
// ignore_for_file: public_member_api_docs
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
