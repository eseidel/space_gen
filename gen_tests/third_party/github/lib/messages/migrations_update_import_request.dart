import 'package:github/model_helpers.dart';
import 'package:github/models/migrations_update_import_request_vcs.dart';
import 'package:meta/meta.dart';

@immutable
class MigrationsUpdateImportRequest {
  const MigrationsUpdateImportRequest({
    this.vcsUsername,
    this.vcsPassword,
    this.vcs,
    this.tfvcProject,
  });

  /// Converts a `Map<String, dynamic>` to a [MigrationsUpdateImportRequest].
  factory MigrationsUpdateImportRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'MigrationsUpdateImportRequest',
      json,
      () => MigrationsUpdateImportRequest(
        vcsUsername: json['vcs_username'] as String?,
        vcsPassword: json['vcs_password'] as String?,
        vcs: MigrationsUpdateImportRequestVcs.maybeFromJson(
          json['vcs'] as String?,
        ),
        tfvcProject: json['tfvc_project'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MigrationsUpdateImportRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MigrationsUpdateImportRequest.fromJson(json);
  }

  /// The username to provide to the originating repository.
  final String? vcsUsername;

  /// The password to provide to the originating repository.
  final String? vcsPassword;

  /// The type of version control system you are migrating from.
  /// Example: `'"git"'`
  final MigrationsUpdateImportRequestVcs? vcs;

  /// For a tfvc import, the name of the project that is being imported.
  /// Example: `'"project1"'`
  final String? tfvcProject;

  /// Converts a [MigrationsUpdateImportRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'vcs_username': vcsUsername,
      'vcs_password': vcsPassword,
      'vcs': vcs?.toJson(),
      'tfvc_project': tfvcProject,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([vcsUsername, vcsPassword, vcs, tfvcProject]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MigrationsUpdateImportRequest &&
        vcsUsername == other.vcsUsername &&
        vcsPassword == other.vcsPassword &&
        vcs == other.vcs &&
        tfvcProject == other.tfvcProject;
  }
}
