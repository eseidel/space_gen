import 'package:discord/model_helpers.dart';
import 'package:discord/models/interaction_callback_types.dart';
import 'package:discord/models/social_layer_sku_purchase_eligibility_callback_data.dart';
import 'package:meta/meta.dart';

@immutable
class SocialLayerSkuPurchaseEligibilityInteractionCallbackRequest {
  const SocialLayerSkuPurchaseEligibilityInteractionCallbackRequest({
    required this.data,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [SocialLayerSkuPurchaseEligibilityInteractionCallbackRequest].
  factory SocialLayerSkuPurchaseEligibilityInteractionCallbackRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SocialLayerSkuPurchaseEligibilityInteractionCallbackRequest',
      json,
      () => SocialLayerSkuPurchaseEligibilityInteractionCallbackRequest(
        data: SocialLayerSkuPurchaseEligibilityCallbackData.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SocialLayerSkuPurchaseEligibilityInteractionCallbackRequest?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SocialLayerSkuPurchaseEligibilityInteractionCallbackRequest.fromJson(
      json,
    );
  }

  InteractionCallbackTypes get type =>
      InteractionCallbackTypes.socialLayerSkuPurchaseEligibility;
  final SocialLayerSkuPurchaseEligibilityCallbackData data;

  /// Converts a [SocialLayerSkuPurchaseEligibilityInteractionCallbackRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type.toJson(), 'data': data.toJson()};
  }

  @override
  int get hashCode => data.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SocialLayerSkuPurchaseEligibilityInteractionCallbackRequest &&
        data == other.data;
  }
}
