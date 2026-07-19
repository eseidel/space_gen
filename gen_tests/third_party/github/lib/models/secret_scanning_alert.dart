// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/model_helpers.dart';
import 'package:github/models/alert_created_at.dart';
import 'package:github/models/alert_html_url.dart';
import 'package:github/models/alert_number.dart';
import 'package:github/models/alert_updated_at.dart';
import 'package:github/models/alert_url.dart';
import 'package:github/models/secret_scanning_alert_resolution.dart';
import 'package:github/models/secret_scanning_alert_state.dart';
import 'package:github/models/secret_scanning_alert_validity.dart';
import 'package:github/models/secret_scanning_first_detected_location.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

@immutable
class SecretScanningAlert {
  const SecretScanningAlert({
    this.number,
    this.createdAt,
    this.updatedAt,
    this.url,
    this.htmlUrl,
    this.locationsUrl,
    this.state,
    this.resolution,
    this.resolvedAt,
    this.resolvedBy,
    this.resolutionComment,
    this.secretType,
    this.secretTypeDisplayName,
    this.secret,
    this.pushProtectionBypassed,
    this.pushProtectionBypassedBy,
    this.pushProtectionBypassedAt,
    this.pushProtectionBypassRequestReviewer,
    this.pushProtectionBypassRequestReviewerComment,
    this.pushProtectionBypassRequestComment,
    this.pushProtectionBypassRequestHtmlUrl,
    this.validity,
    this.publiclyLeaked,
    this.multiRepo,
    this.isBase64Encoded,
    this.firstLocationDetected,
    this.hasMoreLocations,
  });

  /// Converts a `Map<String, dynamic>` to a [SecretScanningAlert].
  factory SecretScanningAlert.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SecretScanningAlert',
      json,
      () => SecretScanningAlert(
        number: AlertNumber.maybeFromJson(json['number'] as int?),
        createdAt: AlertCreatedAt.maybeFromJson(json['created_at'] as String?),
        updatedAt: AlertUpdatedAt.maybeFromJson(json['updated_at'] as String?),
        url: AlertUrl.maybeFromJson(json['url'] as String?),
        htmlUrl: AlertHtmlUrl.maybeFromJson(json['html_url'] as String?),
        locationsUrl: maybeParseUri(json['locations_url'] as String?),
        state: SecretScanningAlertState.maybeFromJson(json['state'] as String?),
        resolution: SecretScanningAlertResolution.maybeFromJson(
          json['resolution'] as String?,
        ),
        resolvedAt: maybeParseDateTime(json['resolved_at'] as String?),
        resolvedBy: SimpleUser.maybeFromJson(
          json['resolved_by'] as Map<String, dynamic>?,
        ),
        resolutionComment: json['resolution_comment'] as String?,
        secretType: json['secret_type'] as String?,
        secretTypeDisplayName: json['secret_type_display_name'] as String?,
        secret: json['secret'] as String?,
        pushProtectionBypassed: json['push_protection_bypassed'] as bool?,
        pushProtectionBypassedBy: SimpleUser.maybeFromJson(
          json['push_protection_bypassed_by'] as Map<String, dynamic>?,
        ),
        pushProtectionBypassedAt: maybeParseDateTime(
          json['push_protection_bypassed_at'] as String?,
        ),
        pushProtectionBypassRequestReviewer: SimpleUser.maybeFromJson(
          json['push_protection_bypass_request_reviewer']
              as Map<String, dynamic>?,
        ),
        pushProtectionBypassRequestReviewerComment:
            json['push_protection_bypass_request_reviewer_comment'] as String?,
        pushProtectionBypassRequestComment:
            json['push_protection_bypass_request_comment'] as String?,
        pushProtectionBypassRequestHtmlUrl: maybeParseUri(
          json['push_protection_bypass_request_html_url'] as String?,
        ),
        validity: SecretScanningAlertValidity.maybeFromJson(
          json['validity'] as String?,
        ),
        publiclyLeaked: json['publicly_leaked'] as bool?,
        multiRepo: json['multi_repo'] as bool?,
        isBase64Encoded: json['is_base64_encoded'] as bool?,
        firstLocationDetected:
            SecretScanningFirstDetectedLocation.maybeFromJson(
              json['first_location_detected'] as Map<String, dynamic>?,
            ),
        hasMoreLocations: json['has_more_locations'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SecretScanningAlert? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SecretScanningAlert.fromJson(json);
  }

  /// The security alert number.
  final AlertNumber? number;

  /// The time that the alert was created in ISO 8601 format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final AlertCreatedAt? createdAt;

  /// The time that the alert was last updated in ISO 8601 format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final AlertUpdatedAt? updatedAt;

  /// The REST API URL of the alert resource.
  final AlertUrl? url;

  /// The GitHub URL of the alert resource.
  final AlertHtmlUrl? htmlUrl;

  /// The REST API URL of the code locations for this alert.
  final Uri? locationsUrl;

  /// Sets the state of the secret scanning alert. You must provide
  /// `resolution` when you set the state to `resolved`.
  final SecretScanningAlertState? state;

  /// **Required when the `state` is `resolved`.** The reason for resolving
  /// the alert.
  final SecretScanningAlertResolution? resolution;

  /// The time that the alert was resolved in ISO 8601 format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? resolvedAt;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? resolvedBy;

  /// An optional comment to resolve an alert.
  final String? resolutionComment;

  /// The type of secret that secret scanning detected.
  final String? secretType;

  /// User-friendly name for the detected secret, matching the `secret_type`.
  /// For a list of built-in patterns, see "[Supported secret scanning
  /// patterns](https://docs.github.com/code-security/secret-scanning/introduction/supported-secret-scanning-patterns#supported-secrets)."
  final String? secretTypeDisplayName;

  /// The secret that was detected.
  final String? secret;

  /// Whether push protection was bypassed for the detected secret.
  final bool? pushProtectionBypassed;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? pushProtectionBypassedBy;

  /// The time that push protection was bypassed in ISO 8601 format:
  /// `YYYY-MM-DDTHH:MM:SSZ`.
  final DateTime? pushProtectionBypassedAt;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? pushProtectionBypassRequestReviewer;

  /// An optional comment when reviewing a push protection bypass.
  final String? pushProtectionBypassRequestReviewerComment;

  /// An optional comment when requesting a push protection bypass.
  final String? pushProtectionBypassRequestComment;

  /// The URL to a push protection bypass request.
  final Uri? pushProtectionBypassRequestHtmlUrl;

  /// The token status as of the latest validity check.
  final SecretScanningAlertValidity? validity;

  /// Whether the detected secret was publicly leaked.
  final bool? publiclyLeaked;

  /// Whether the detected secret was found in multiple repositories under the
  /// same organization or enterprise.
  final bool? multiRepo;

  /// A boolean value representing whether or not alert is base64 encoded
  final bool? isBase64Encoded;

  /// Details on the location where the token was initially detected. This can
  /// be a commit, wiki commit, issue, discussion, pull request.
  final SecretScanningFirstDetectedLocation? firstLocationDetected;

  /// A boolean value representing whether or not the token in the alert was
  /// detected in more than one location.
  final bool? hasMoreLocations;

  /// Converts a [SecretScanningAlert] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'number': number?.toJson(),
      'created_at': createdAt?.toJson(),
      'updated_at': updatedAt?.toJson(),
      'url': url?.toJson(),
      'html_url': htmlUrl?.toJson(),
      'locations_url': locationsUrl?.toString(),
      'state': state?.toJson(),
      'resolution': resolution?.toJson(),
      'resolved_at': resolvedAt?.toIso8601String(),
      'resolved_by': resolvedBy?.toJson(),
      'resolution_comment': resolutionComment,
      'secret_type': secretType,
      'secret_type_display_name': secretTypeDisplayName,
      'secret': secret,
      'push_protection_bypassed': pushProtectionBypassed,
      'push_protection_bypassed_by': pushProtectionBypassedBy?.toJson(),
      'push_protection_bypassed_at': pushProtectionBypassedAt
          ?.toIso8601String(),
      'push_protection_bypass_request_reviewer':
          pushProtectionBypassRequestReviewer?.toJson(),
      'push_protection_bypass_request_reviewer_comment':
          pushProtectionBypassRequestReviewerComment,
      'push_protection_bypass_request_comment':
          pushProtectionBypassRequestComment,
      'push_protection_bypass_request_html_url':
          pushProtectionBypassRequestHtmlUrl?.toString(),
      'validity': validity?.toJson(),
      'publicly_leaked': publiclyLeaked,
      'multi_repo': multiRepo,
      'is_base64_encoded': isBase64Encoded,
      'first_location_detected': firstLocationDetected?.toJson(),
      'has_more_locations': hasMoreLocations,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    number,
    createdAt,
    updatedAt,
    url,
    htmlUrl,
    locationsUrl,
    state,
    resolution,
    resolvedAt,
    resolvedBy,
    resolutionComment,
    secretType,
    secretTypeDisplayName,
    secret,
    pushProtectionBypassed,
    pushProtectionBypassedBy,
    pushProtectionBypassedAt,
    pushProtectionBypassRequestReviewer,
    pushProtectionBypassRequestReviewerComment,
    pushProtectionBypassRequestComment,
    pushProtectionBypassRequestHtmlUrl,
    validity,
    publiclyLeaked,
    multiRepo,
    isBase64Encoded,
    firstLocationDetected,
    hasMoreLocations,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SecretScanningAlert &&
        number == other.number &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        locationsUrl == other.locationsUrl &&
        state == other.state &&
        resolution == other.resolution &&
        resolvedAt == other.resolvedAt &&
        resolvedBy == other.resolvedBy &&
        resolutionComment == other.resolutionComment &&
        secretType == other.secretType &&
        secretTypeDisplayName == other.secretTypeDisplayName &&
        secret == other.secret &&
        pushProtectionBypassed == other.pushProtectionBypassed &&
        pushProtectionBypassedBy == other.pushProtectionBypassedBy &&
        pushProtectionBypassedAt == other.pushProtectionBypassedAt &&
        pushProtectionBypassRequestReviewer ==
            other.pushProtectionBypassRequestReviewer &&
        pushProtectionBypassRequestReviewerComment ==
            other.pushProtectionBypassRequestReviewerComment &&
        pushProtectionBypassRequestComment ==
            other.pushProtectionBypassRequestComment &&
        pushProtectionBypassRequestHtmlUrl ==
            other.pushProtectionBypassRequestHtmlUrl &&
        validity == other.validity &&
        publiclyLeaked == other.publiclyLeaked &&
        multiRepo == other.multiRepo &&
        isBase64Encoded == other.isBase64Encoded &&
        firstLocationDetected == other.firstLocationDetected &&
        hasMoreLocations == other.hasMoreLocations;
  }
}
