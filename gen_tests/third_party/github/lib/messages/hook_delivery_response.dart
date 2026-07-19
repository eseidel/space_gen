import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class HookDeliveryResponse {
  const HookDeliveryResponse({required this.headers, required this.payload});

  /// Converts a `Map<String, dynamic>` to a [HookDeliveryResponse].
  factory HookDeliveryResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'HookDeliveryResponse',
      json,
      () => HookDeliveryResponse(
        headers: checkedKey(json, 'headers') as Map<String, dynamic>?,
        payload: checkedKey(json, 'payload') as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static HookDeliveryResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return HookDeliveryResponse.fromJson(json);
  }

  /// The response headers received when the delivery was made.
  final Map<String, dynamic>? headers;

  /// The response payload received.
  final String? payload;

  /// Converts a [HookDeliveryResponse] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'headers': headers, 'payload': payload};
  }

  @override
  int get hashCode => Object.hashAll([mapHash(headers), payload]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is HookDeliveryResponse &&
        mapsEqual(headers, other.headers) &&
        payload == other.payload;
  }
}
