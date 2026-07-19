import 'package:github/model_helpers.dart';
import 'package:github/models/migrations_start_import_request_vcs.dart';
import 'package:meta/meta.dart';

@immutable
class MigrationsStartImportRequest {
  const MigrationsStartImportRequest({
    required this.vcsUrl,
    this.vcs,
    this.vcsUsername,
    this.vcsPassword,
    this.tfvcProject,
  });

  /// Converts a `Map<String, dynamic>` to a [MigrationsStartImportRequest].
  factory MigrationsStartImportRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MigrationsStartImportRequest',
      json,
      () => MigrationsStartImportRequest(
        vcsUrl: json['vcs_url'] as String,
        vcs: MigrationsStartImportRequestVcs.maybeFromJson(
          json['vcs'] as String?,
        ),
        vcsUsername: json['vcs_username'] as String?,
        vcsPassword: json['vcs_password'] as String?,
        tfvcProject: json['tfvc_project'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MigrationsStartImportRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MigrationsStartImportRequest.fromJson(json);
  }

  /// The URL of the originating repository.
  final String vcsUrl;

  /// The originating VCS type. Without this parameter, the import job will
  /// take additional time to detect the VCS type before beginning the import.
  /// This detection step will be reflected in the response.
  final MigrationsStartImportRequestVcs? vcs;

  /// If authentication is required, the username to provide to `vcs_url`.
  final String? vcsUsername;

  /// If authentication is required, the password to provide to `vcs_url`.
  final String? vcsPassword;

  /// For a tfvc import, the name of the project that is being imported.
  final String? tfvcProject;

  /// Converts a [MigrationsStartImportRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'vcs_url': vcsUrl,
      'vcs': vcs?.toJson(),
      'vcs_username': vcsUsername,
      'vcs_password': vcsPassword,
      'tfvc_project': tfvcProject,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([vcsUrl, vcs, vcsUsername, vcsPassword, tfvcProject]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MigrationsStartImportRequest &&
        vcsUrl == other.vcsUrl &&
        vcs == other.vcs &&
        vcsUsername == other.vcsUsername &&
        vcsPassword == other.vcsPassword &&
        tfvcProject == other.tfvcProject;
  }
}
