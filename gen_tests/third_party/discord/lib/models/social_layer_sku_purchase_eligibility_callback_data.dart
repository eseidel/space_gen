import 'package:discord/api_exception.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/sku_ineligibility_reason.dart';
import 'package:meta/meta.dart';

@immutable
class SocialLayerSkuPurchaseEligibilityCallbackData {
  SocialLayerSkuPurchaseEligibilityCallbackData({
    required this.eligible,
    this.ineligibleReason,
    this.ineligibleReasonDescription,
  }) {
    ineligibleReasonDescription?.validate(maxLength: 255);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [SocialLayerSkuPurchaseEligibilityCallbackData].
  factory SocialLayerSkuPurchaseEligibilityCallbackData.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'SocialLayerSkuPurchaseEligibilityCallbackData',
      json,
      () => SocialLayerSkuPurchaseEligibilityCallbackData(
        eligible: json['eligible'] as bool,
        ineligibleReason: SkuIneligibilityReason.maybeFromJson(
          json['ineligible_reason'] as int?,
        ),
        ineligibleReasonDescription:
            json['ineligible_reason_description'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SocialLayerSkuPurchaseEligibilityCallbackData? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SocialLayerSkuPurchaseEligibilityCallbackData.fromJson(json);
  }

  final bool eligible;
  final SkuIneligibilityReason? ineligibleReason;
  final String? ineligibleReasonDescription;

  /// Converts a [SocialLayerSkuPurchaseEligibilityCallbackData]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'eligible': eligible,
      'ineligible_reason': ineligibleReason?.toJson(),
      'ineligible_reason_description': ineligibleReasonDescription,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([eligible, ineligibleReason, ineligibleReasonDescription]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SocialLayerSkuPurchaseEligibilityCallbackData &&
        eligible == other.eligible &&
        ineligibleReason == other.ineligibleReason &&
        ineligibleReasonDescription == other.ineligibleReasonDescription;
  }
}
