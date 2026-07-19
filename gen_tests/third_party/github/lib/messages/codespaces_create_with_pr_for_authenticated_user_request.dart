import 'package:github/model_helpers.dart';
import 'package:github/models/codespaces_create_with_pr_for_authenticated_user_request_geo.dart';
import 'package:meta/meta.dart';

@immutable
class CodespacesCreateWithPrForAuthenticatedUserRequest {
  const CodespacesCreateWithPrForAuthenticatedUserRequest({
    this.location,
    this.geo,
    this.clientIp,
    this.machine,
    this.devcontainerPath,
    this.multiRepoPermissionsOptOut,
    this.workingDirectory,
    this.idleTimeoutMinutes,
    this.displayName,
    this.retentionPeriodMinutes,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesCreateWithPrForAuthenticatedUserRequest].
  factory CodespacesCreateWithPrForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesCreateWithPrForAuthenticatedUserRequest',
      json,
      () => CodespacesCreateWithPrForAuthenticatedUserRequest(
        location: json['location'] as String?,
        geo: CodespacesCreateWithPrForAuthenticatedUserRequestGeo.maybeFromJson(
          json['geo'] as String?,
        ),
        clientIp: json['client_ip'] as String?,
        machine: json['machine'] as String?,
        devcontainerPath: json['devcontainer_path'] as String?,
        multiRepoPermissionsOptOut:
            json['multi_repo_permissions_opt_out'] as bool?,
        workingDirectory: json['working_directory'] as String?,
        idleTimeoutMinutes: json['idle_timeout_minutes'] as int?,
        displayName: json['display_name'] as String?,
        retentionPeriodMinutes: json['retention_period_minutes'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesCreateWithPrForAuthenticatedUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesCreateWithPrForAuthenticatedUserRequest.fromJson(json);
  }

  /// The requested location for a new codespace. Best efforts are made to
  /// respect this upon creation. Assigned by IP if not provided.
  final String? location;

  /// The geographic area for this codespace. If not specified, the value is
  /// assigned by IP. This property replaces `location`, which is closing
  /// down.
  final CodespacesCreateWithPrForAuthenticatedUserRequestGeo? geo;

  /// IP for location auto-detection when proxying a request
  final String? clientIp;

  /// Machine type to use for this codespace
  final String? machine;

  /// Path to devcontainer.json config to use for this codespace
  final String? devcontainerPath;

  /// Whether to authorize requested permissions from devcontainer.json
  final bool? multiRepoPermissionsOptOut;

  /// Working directory for this codespace
  final String? workingDirectory;

  /// Time in minutes before codespace stops from inactivity
  final int? idleTimeoutMinutes;

  /// Display name for this codespace
  final String? displayName;

  /// Duration in minutes after codespace has gone idle in which it will be
  /// deleted. Must be integer minutes between 0 and 43200 (30 days).
  final int? retentionPeriodMinutes;

  /// Converts a [CodespacesCreateWithPrForAuthenticatedUserRequest]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      if (location != null) 'location': location,
      if (geo != null) 'geo': geo?.toJson(),
      if (clientIp != null) 'client_ip': clientIp,
      if (machine != null) 'machine': machine,
      if (devcontainerPath != null) 'devcontainer_path': devcontainerPath,
      if (multiRepoPermissionsOptOut != null)
        'multi_repo_permissions_opt_out': multiRepoPermissionsOptOut,
      if (workingDirectory != null) 'working_directory': workingDirectory,
      if (idleTimeoutMinutes != null)
        'idle_timeout_minutes': idleTimeoutMinutes,
      if (displayName != null) 'display_name': displayName,
      if (retentionPeriodMinutes != null)
        'retention_period_minutes': retentionPeriodMinutes,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    location,
    geo,
    clientIp,
    machine,
    devcontainerPath,
    multiRepoPermissionsOptOut,
    workingDirectory,
    idleTimeoutMinutes,
    displayName,
    retentionPeriodMinutes,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesCreateWithPrForAuthenticatedUserRequest &&
        location == other.location &&
        geo == other.geo &&
        clientIp == other.clientIp &&
        machine == other.machine &&
        devcontainerPath == other.devcontainerPath &&
        multiRepoPermissionsOptOut == other.multiRepoPermissionsOptOut &&
        workingDirectory == other.workingDirectory &&
        idleTimeoutMinutes == other.idleTimeoutMinutes &&
        displayName == other.displayName &&
        retentionPeriodMinutes == other.retentionPeriodMinutes;
  }
}
