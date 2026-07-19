import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template page_build_status}
/// Page Build Status
/// Page Build Status
/// {@endtemplate}
@immutable
class PageBuildStatus {
  /// {@macro page_build_status}
  const PageBuildStatus({required this.url, required this.status});

  /// Converts a `Map<String, dynamic>` to a [PageBuildStatus].
  factory PageBuildStatus.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PageBuildStatus',
      json,
      () => PageBuildStatus(
        url: Uri.parse(json['url'] as String),
        status: json['status'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PageBuildStatus? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PageBuildStatus.fromJson(json);
  }

  /// Example:
  /// `'https://api.github.com/repos/github/hello-world/pages/builds/latest'`
  final Uri url;

  /// Example: `'queued'`
  final String status;

  /// Converts a [PageBuildStatus] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'url': url.toString(), 'status': status};
  }

  @override
  int get hashCode => Object.hashAll([url, status]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PageBuildStatus &&
        url == other.url &&
        status == other.status;
  }
}
