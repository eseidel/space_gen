import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template snapshot_detector}
/// A description of the detector used.
/// {@endtemplate}
@immutable
class SnapshotDetector {
  /// {@macro snapshot_detector}
  const SnapshotDetector({
    required this.name,
    required this.version,
    required this.url,
  });

  /// Converts a `Map<String, dynamic>` to a [SnapshotDetector].
  factory SnapshotDetector.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'SnapshotDetector',
      json,
      () => SnapshotDetector(
        name: json['name'] as String,
        version: json['version'] as String,
        url: json['url'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SnapshotDetector? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return SnapshotDetector.fromJson(json);
  }

  /// The name of the detector used.
  /// Example: `'docker buildtime detector'`
  final String name;

  /// The version of the detector used.
  /// Example: `'1.0.0'`
  final String version;

  /// The url of the detector used.
  /// Example: `'http://example.com/docker-buildtimer-detector'`
  final String url;

  /// Converts a [SnapshotDetector] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'name': name, 'version': version, 'url': url};
  }

  @override
  int get hashCode => Object.hashAll([name, version, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SnapshotDetector &&
        name == other.name &&
        version == other.version &&
        url == other.url;
  }
}
