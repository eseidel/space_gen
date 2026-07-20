import 'package:github/api_exception.dart';
import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class CampaignsCreateCampaignRequestCodeScanningAlertsInner {
  CampaignsCreateCampaignRequestCodeScanningAlertsInner({
    required this.repositoryId,
    required this.alertNumbers,
  }) {
    alertNumbers.validate(minItems: 1);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [CampaignsCreateCampaignRequestCodeScanningAlertsInner].
  factory CampaignsCreateCampaignRequestCodeScanningAlertsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CampaignsCreateCampaignRequestCodeScanningAlertsInner',
      json,
      () => CampaignsCreateCampaignRequestCodeScanningAlertsInner(
        repositoryId: json['repository_id'] as int,
        alertNumbers: (json['alert_numbers'] as List).cast<int>(),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CampaignsCreateCampaignRequestCodeScanningAlertsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CampaignsCreateCampaignRequestCodeScanningAlertsInner.fromJson(json);
  }

  /// The repository id
  final int repositoryId;

  /// The alert numbers
  final List<int> alertNumbers;

  /// Converts a [CampaignsCreateCampaignRequestCodeScanningAlertsInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'repository_id': repositoryId, 'alert_numbers': alertNumbers};
  }

  @override
  int get hashCode => Object.hashAll([repositoryId, listHash(alertNumbers)]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CampaignsCreateCampaignRequestCodeScanningAlertsInner &&
        repositoryId == other.repositoryId &&
        listsEqual(alertNumbers, other.alertNumbers);
  }
}
