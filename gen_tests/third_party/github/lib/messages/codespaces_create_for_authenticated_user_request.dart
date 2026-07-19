// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:github/messages/codespaces_create_for_authenticated_user_request_one_of_1_pull_request.dart';
import 'package:github/model_helpers.dart';
import 'package:github/models/codespaces_create_for_authenticated_user_request_one_of_0_geo.dart';
import 'package:github/models/codespaces_create_for_authenticated_user_request_one_of_1_geo.dart';
import 'package:meta/meta.dart';

sealed class CodespacesCreateForAuthenticatedUserRequest {
  const CodespacesCreateForAuthenticatedUserRequest();

  factory CodespacesCreateForAuthenticatedUserRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json.containsKey('repository_id')) {
      return CodespacesCreateForAuthenticatedUserRequestOneOf0.fromJson(json);
    }
    if (json.containsKey('pull_request')) {
      return CodespacesCreateForAuthenticatedUserRequestOneOf1.fromJson(json);
    }
    throw FormatException(
      'No variant of CodespacesCreateForAuthenticatedUserRequest matched json keys: ${json.keys.toList()}',
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesCreateForAuthenticatedUserRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesCreateForAuthenticatedUserRequest.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class CodespacesCreateForAuthenticatedUserRequestOneOf0
    extends CodespacesCreateForAuthenticatedUserRequest {
  const CodespacesCreateForAuthenticatedUserRequestOneOf0({
    required this.repositoryId,
    this.ref,
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
  /// [CodespacesCreateForAuthenticatedUserRequestOneOf0].
  factory CodespacesCreateForAuthenticatedUserRequestOneOf0.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesCreateForAuthenticatedUserRequestOneOf0',
      json,
      () => CodespacesCreateForAuthenticatedUserRequestOneOf0(
        repositoryId: json['repository_id'] as int,
        ref: json['ref'] as String?,
        location: json['location'] as String?,
        geo: CodespacesCreateForAuthenticatedUserRequestOneOf0Geo.maybeFromJson(
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
  static CodespacesCreateForAuthenticatedUserRequestOneOf0? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesCreateForAuthenticatedUserRequestOneOf0.fromJson(json);
  }

  /// Repository id for this codespace
  final int repositoryId;

  /// Git ref (typically a branch name) for this codespace
  final String? ref;

  /// The requested location for a new codespace. Best efforts are made to
  /// respect this upon creation. Assigned by IP if not provided.
  final String? location;

  /// The geographic area for this codespace. If not specified, the value is
  /// assigned by IP. This property replaces `location`, which is closing
  /// down.
  final CodespacesCreateForAuthenticatedUserRequestOneOf0Geo? geo;

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

  /// Converts a [CodespacesCreateForAuthenticatedUserRequestOneOf0]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'repository_id': repositoryId,
      if (ref != null) 'ref': ref,
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
    repositoryId,
    ref,
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
    return other is CodespacesCreateForAuthenticatedUserRequestOneOf0 &&
        repositoryId == other.repositoryId &&
        ref == other.ref &&
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

@immutable
final class CodespacesCreateForAuthenticatedUserRequestOneOf1
    extends CodespacesCreateForAuthenticatedUserRequest {
  const CodespacesCreateForAuthenticatedUserRequestOneOf1({
    required this.pullRequest,
    this.location,
    this.geo,
    this.machine,
    this.devcontainerPath,
    this.workingDirectory,
    this.idleTimeoutMinutes,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [CodespacesCreateForAuthenticatedUserRequestOneOf1].
  factory CodespacesCreateForAuthenticatedUserRequestOneOf1.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'CodespacesCreateForAuthenticatedUserRequestOneOf1',
      json,
      () => CodespacesCreateForAuthenticatedUserRequestOneOf1(
        pullRequest:
            CodespacesCreateForAuthenticatedUserRequestOneOf1PullRequest.fromJson(
              json['pull_request'] as Map<String, dynamic>,
            ),
        location: json['location'] as String?,
        geo: CodespacesCreateForAuthenticatedUserRequestOneOf1Geo.maybeFromJson(
          json['geo'] as String?,
        ),
        machine: json['machine'] as String?,
        devcontainerPath: json['devcontainer_path'] as String?,
        workingDirectory: json['working_directory'] as String?,
        idleTimeoutMinutes: json['idle_timeout_minutes'] as int?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CodespacesCreateForAuthenticatedUserRequestOneOf1? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return CodespacesCreateForAuthenticatedUserRequestOneOf1.fromJson(json);
  }

  /// Pull request number for this codespace
  final CodespacesCreateForAuthenticatedUserRequestOneOf1PullRequest
  pullRequest;

  /// The requested location for a new codespace. Best efforts are made to
  /// respect this upon creation. Assigned by IP if not provided.
  final String? location;

  /// The geographic area for this codespace. If not specified, the value is
  /// assigned by IP. This property replaces `location`, which is closing
  /// down.
  final CodespacesCreateForAuthenticatedUserRequestOneOf1Geo? geo;

  /// Machine type to use for this codespace
  final String? machine;

  /// Path to devcontainer.json config to use for this codespace
  final String? devcontainerPath;

  /// Working directory for this codespace
  final String? workingDirectory;

  /// Time in minutes before codespace stops from inactivity
  final int? idleTimeoutMinutes;

  /// Converts a [CodespacesCreateForAuthenticatedUserRequestOneOf1]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'pull_request': pullRequest.toJson(),
      if (location != null) 'location': location,
      if (geo != null) 'geo': geo?.toJson(),
      if (machine != null) 'machine': machine,
      if (devcontainerPath != null) 'devcontainer_path': devcontainerPath,
      if (workingDirectory != null) 'working_directory': workingDirectory,
      if (idleTimeoutMinutes != null)
        'idle_timeout_minutes': idleTimeoutMinutes,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    pullRequest,
    location,
    geo,
    machine,
    devcontainerPath,
    workingDirectory,
    idleTimeoutMinutes,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CodespacesCreateForAuthenticatedUserRequestOneOf1 &&
        pullRequest == other.pullRequest &&
        location == other.location &&
        geo == other.geo &&
        machine == other.machine &&
        devcontainerPath == other.devcontainerPath &&
        workingDirectory == other.workingDirectory &&
        idleTimeoutMinutes == other.idleTimeoutMinutes;
  }
}
