import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template runner_application}
/// Runner Application
/// Runner Application
/// {@endtemplate}
@immutable
class RunnerApplication {
  /// {@macro runner_application}
  const RunnerApplication({
    required this.os,
    required this.architecture,
    required this.downloadUrl,
    required this.filename,
    this.tempDownloadToken,
    this.sha256Checksum,
  });

  /// Converts a `Map<String, dynamic>` to a [RunnerApplication].
  factory RunnerApplication.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RunnerApplication',
      json,
      () => RunnerApplication(
        os: json['os'] as String,
        architecture: json['architecture'] as String,
        downloadUrl: json['download_url'] as String,
        filename: json['filename'] as String,
        tempDownloadToken: json['temp_download_token'] as String?,
        sha256Checksum: json['sha256_checksum'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RunnerApplication? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RunnerApplication.fromJson(json);
  }

  final String os;
  final String architecture;
  final String downloadUrl;
  final String filename;

  /// A short lived bearer token used to download the runner, if needed.
  final String? tempDownloadToken;
  final String? sha256Checksum;

  /// Converts a [RunnerApplication] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'os': os,
      'architecture': architecture,
      'download_url': downloadUrl,
      'filename': filename,
      'temp_download_token': tempDownloadToken,
      'sha256_checksum': sha256Checksum,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    os,
    architecture,
    downloadUrl,
    filename,
    tempDownloadToken,
    sha256Checksum,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RunnerApplication &&
        os == other.os &&
        architecture == other.architecture &&
        downloadUrl == other.downloadUrl &&
        filename == other.filename &&
        tempDownloadToken == other.tempDownloadToken &&
        sha256Checksum == other.sha256Checksum;
  }
}
