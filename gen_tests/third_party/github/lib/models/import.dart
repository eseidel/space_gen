import 'package:github/model_helpers.dart';
import 'package:github/models/import_project_choices_inner.dart';
import 'package:github/models/import_status.dart';
import 'package:meta/meta.dart';

/// {@template import}
/// Import
/// A repository import from an external source.
/// {@endtemplate}
@immutable
class Import {
  /// {@macro import}
  const Import({
    required this.vcs,
    required this.vcsUrl,
    required this.status,
    required this.url,
    required this.htmlUrl,
    required this.authorsUrl,
    required this.repositoryUrl,
    this.useLfs,
    this.svcRoot,
    this.tfvcProject,
    this.statusText,
    this.failedStep,
    this.errorMessage,
    this.importPercent,
    this.commitCount,
    this.pushPercent,
    this.hasLargeFiles,
    this.largeFilesSize,
    this.largeFilesCount,
    this.projectChoices,
    this.message,
    this.authorsCount,
    this.svnRoot,
  });

  /// Converts a `Map<String, dynamic>` to an [Import].
  factory Import.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Import',
      json,
      () => Import(
        vcs: checkedKey(json, 'vcs') as String?,
        useLfs: json['use_lfs'] as bool?,
        vcsUrl: json['vcs_url'] as String,
        svcRoot: json['svc_root'] as String?,
        tfvcProject: json['tfvc_project'] as String?,
        status: ImportStatus.fromJson(json['status'] as String),
        statusText: json['status_text'] as String?,
        failedStep: json['failed_step'] as String?,
        errorMessage: json['error_message'] as String?,
        importPercent: json['import_percent'] as int?,
        commitCount: json['commit_count'] as int?,
        pushPercent: json['push_percent'] as int?,
        hasLargeFiles: json['has_large_files'] as bool?,
        largeFilesSize: json['large_files_size'] as int?,
        largeFilesCount: json['large_files_count'] as int?,
        projectChoices: (json['project_choices'] as List?)
            ?.map<ImportProjectChoicesInner>(
              (e) =>
                  ImportProjectChoicesInner.fromJson(e as Map<String, dynamic>),
            )
            .toList(),
        message: json['message'] as String?,
        authorsCount: json['authors_count'] as int?,
        url: Uri.parse(json['url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
        authorsUrl: Uri.parse(json['authors_url'] as String),
        repositoryUrl: Uri.parse(json['repository_url'] as String),
        svnRoot: json['svn_root'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Import? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Import.fromJson(json);
  }

  final String? vcs;
  final bool? useLfs;

  /// The URL of the originating repository.
  final String vcsUrl;
  final String? svcRoot;
  final String? tfvcProject;
  final ImportStatus status;
  final String? statusText;
  final String? failedStep;
  final String? errorMessage;
  final int? importPercent;
  final int? commitCount;
  final int? pushPercent;
  final bool? hasLargeFiles;
  final int? largeFilesSize;
  final int? largeFilesCount;
  final List<ImportProjectChoicesInner>? projectChoices;
  final String? message;
  final int? authorsCount;
  final Uri url;
  final Uri htmlUrl;
  final Uri authorsUrl;
  final Uri repositoryUrl;
  final String? svnRoot;

  /// Converts an [Import] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'vcs': vcs,
      if (useLfs != null) 'use_lfs': useLfs,
      'vcs_url': vcsUrl,
      if (svcRoot != null) 'svc_root': svcRoot,
      if (tfvcProject != null) 'tfvc_project': tfvcProject,
      'status': status.toJson(),
      'status_text': statusText,
      'failed_step': failedStep,
      'error_message': errorMessage,
      'import_percent': importPercent,
      'commit_count': commitCount,
      'push_percent': pushPercent,
      if (hasLargeFiles != null) 'has_large_files': hasLargeFiles,
      if (largeFilesSize != null) 'large_files_size': largeFilesSize,
      if (largeFilesCount != null) 'large_files_count': largeFilesCount,
      if (projectChoices != null)
        'project_choices': projectChoices?.map((e) => e.toJson()).toList(),
      if (message != null) 'message': message,
      'authors_count': authorsCount,
      'url': url.toString(),
      'html_url': htmlUrl.toString(),
      'authors_url': authorsUrl.toString(),
      'repository_url': repositoryUrl.toString(),
      if (svnRoot != null) 'svn_root': svnRoot,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    vcs,
    useLfs,
    vcsUrl,
    svcRoot,
    tfvcProject,
    status,
    statusText,
    failedStep,
    errorMessage,
    importPercent,
    commitCount,
    pushPercent,
    hasLargeFiles,
    largeFilesSize,
    largeFilesCount,
    listHash(projectChoices),
    message,
    authorsCount,
    url,
    htmlUrl,
    authorsUrl,
    repositoryUrl,
    svnRoot,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Import &&
        vcs == other.vcs &&
        useLfs == other.useLfs &&
        vcsUrl == other.vcsUrl &&
        svcRoot == other.svcRoot &&
        tfvcProject == other.tfvcProject &&
        status == other.status &&
        statusText == other.statusText &&
        failedStep == other.failedStep &&
        errorMessage == other.errorMessage &&
        importPercent == other.importPercent &&
        commitCount == other.commitCount &&
        pushPercent == other.pushPercent &&
        hasLargeFiles == other.hasLargeFiles &&
        largeFilesSize == other.largeFilesSize &&
        largeFilesCount == other.largeFilesCount &&
        listsEqual(projectChoices, other.projectChoices) &&
        message == other.message &&
        authorsCount == other.authorsCount &&
        url == other.url &&
        htmlUrl == other.htmlUrl &&
        authorsUrl == other.authorsUrl &&
        repositoryUrl == other.repositoryUrl &&
        svnRoot == other.svnRoot;
  }
}
