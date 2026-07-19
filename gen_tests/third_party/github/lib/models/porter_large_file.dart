import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template porter_large_file}
/// Porter Large File
/// Porter Large File
/// {@endtemplate}
@immutable
class PorterLargeFile {
  /// {@macro porter_large_file}
  const PorterLargeFile({
    required this.refName,
    required this.path,
    required this.oid,
    required this.size,
  });

  /// Converts a `Map<String, dynamic>` to a [PorterLargeFile].
  factory PorterLargeFile.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PorterLargeFile',
      json,
      () => PorterLargeFile(
        refName: json['ref_name'] as String,
        path: json['path'] as String,
        oid: json['oid'] as String,
        size: json['size'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PorterLargeFile? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PorterLargeFile.fromJson(json);
  }

  final String refName;
  final String path;
  final String oid;
  final int size;

  /// Converts a [PorterLargeFile] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'ref_name': refName, 'path': path, 'oid': oid, 'size': size};
  }

  @override
  int get hashCode => Object.hashAll([refName, path, oid, size]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PorterLargeFile &&
        refName == other.refName &&
        path == other.path &&
        oid == other.oid &&
        size == other.size;
  }
}
