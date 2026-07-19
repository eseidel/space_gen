import 'package:github/model_helpers.dart';
import 'package:github/models/page_build_error.dart';
import 'package:github/models/simple_user.dart';
import 'package:meta/meta.dart';

/// {@template page_build}
/// Page Build
/// Page Build
/// {@endtemplate}
@immutable
class PageBuild {
  /// {@macro page_build}
  const PageBuild({
    required this.url,
    required this.status,
    required this.error,
    required this.pusher,
    required this.commit,
    required this.duration,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Converts a `Map<String, dynamic>` to a [PageBuild].
  factory PageBuild.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'PageBuild',
      json,
      () => PageBuild(
        url: Uri.parse(json['url'] as String),
        status: json['status'] as String,
        error: PageBuildError.fromJson(json['error'] as Map<String, dynamic>),
        pusher: SimpleUser.maybeFromJson(
          checkedKey(json, 'pusher') as Map<String, dynamic>?,
        ),
        commit: json['commit'] as String,
        duration: json['duration'] as int,
        createdAt: DateTime.parse(json['created_at'] as String),
        updatedAt: DateTime.parse(json['updated_at'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static PageBuild? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return PageBuild.fromJson(json);
  }

  final Uri url;
  final String status;
  final PageBuildError error;

  /// Simple User
  /// A GitHub user.
  final SimpleUser? pusher;
  final String commit;
  final int duration;
  final DateTime createdAt;
  final DateTime updatedAt;

  /// Converts a [PageBuild] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url.toString(),
      'status': status,
      'error': error.toJson(),
      'pusher': pusher?.toJson(),
      'commit': commit,
      'duration': duration,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    status,
    error,
    pusher,
    commit,
    duration,
    createdAt,
    updatedAt,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is PageBuild &&
        url == other.url &&
        status == other.status &&
        error == other.error &&
        pusher == other.pusher &&
        commit == other.commit &&
        duration == other.duration &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }
}
