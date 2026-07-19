import 'package:github/model_helpers.dart';
import 'package:github/models/manifest.dart';
import 'package:github/models/metadata_1.dart';
import 'package:github/models/snapshot_detector.dart';
import 'package:github/models/snapshot_job.dart';
import 'package:meta/meta.dart';

/// {@template snapshot}
/// snapshot
/// Create a new snapshot of a repository's dependencies.
/// {@endtemplate}
@immutable
class Snapshot {
  /// {@macro snapshot}
  const Snapshot({
    required this.version,
    required this.job,
    required this.sha,
    required this.ref,
    required this.detector,
    required this.scanned,
    this.metadata,
    this.manifests,
  });

  /// Converts a `Map<String, dynamic>` to a [Snapshot].
  factory Snapshot.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Snapshot',
      json,
      () => Snapshot(
        version: json['version'] as int,
        job: SnapshotJob.fromJson(json['job'] as Map<String, dynamic>),
        sha: json['sha'] as String,
        ref: json['ref'] as String,
        detector: SnapshotDetector.fromJson(
          json['detector'] as Map<String, dynamic>,
        ),
        metadata: (json['metadata'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, Metadata1.fromJson(value as dynamic)),
        ),
        manifests: (json['manifests'] as Map<String, dynamic>?)?.map(
          (key, value) =>
              MapEntry(key, Manifest.fromJson(value as Map<String, dynamic>)),
        ),
        scanned: DateTime.parse(json['scanned'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Snapshot? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Snapshot.fromJson(json);
  }

  /// The version of the repository snapshot submission.
  final int version;
  final SnapshotJob job;

  /// The commit SHA associated with this dependency snapshot. Maximum length:
  /// 40 characters.
  /// Example: `'ddc951f4b1293222421f2c8df679786153acf689'`
  final String sha;

  /// The repository branch that triggered this snapshot.
  /// Example: `'refs/heads/main'`
  final String ref;

  /// A description of the detector used.
  final SnapshotDetector detector;

  /// metadata
  /// User-defined metadata to store domain-specific information limited to 8
  /// keys with scalar values.
  final Map<String, Metadata1>? metadata;

  /// A collection of package manifests, which are a collection of related
  /// dependencies declared in a file or representing a logical group of
  /// dependencies.
  final Map<String, Manifest>? manifests;

  /// The time at which the snapshot was scanned.
  /// Example: `'2020-06-13T14:52:50-05:00'`
  final DateTime scanned;

  /// Converts a [Snapshot] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'job': job.toJson(),
      'sha': sha,
      'ref': ref,
      'detector': detector.toJson(),
      if (metadata != null)
        'metadata': metadata?.map(
          (key, value) => MapEntry(key, value.toJson()),
        ),
      if (manifests != null)
        'manifests': manifests?.map(
          (key, value) => MapEntry(key, value.toJson()),
        ),
      'scanned': scanned.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    version,
    job,
    sha,
    ref,
    detector,
    mapHash(metadata),
    mapHash(manifests),
    scanned,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Snapshot &&
        version == other.version &&
        job == other.job &&
        sha == other.sha &&
        ref == other.ref &&
        detector == other.detector &&
        mapsEqual(metadata, other.metadata) &&
        mapsEqual(manifests, other.manifests) &&
        scanned == other.scanned;
  }
}
