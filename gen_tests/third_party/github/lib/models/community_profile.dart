import 'package:github/model_helpers.dart';
import 'package:github/models/community_profile_files.dart';
import 'package:meta/meta.dart';

/// {@template community_profile}
/// Community Profile
/// Community Profile
/// {@endtemplate}
@immutable
class CommunityProfile {
  /// {@macro community_profile}
  const CommunityProfile({
    required this.healthPercentage,
    required this.description,
    required this.documentation,
    required this.files,
    required this.updatedAt,
    this.contentReportsEnabled,
  });

  /// Converts a `Map<String, dynamic>` to a [CommunityProfile].
  factory CommunityProfile.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CommunityProfile',
      json,
      () => CommunityProfile(
        healthPercentage: json['health_percentage'] as int,
        description: checkedKey(json, 'description') as String?,
        documentation: checkedKey(json, 'documentation') as String?,
        files: CommunityProfileFiles.fromJson(
          json['files'] as Map<String, dynamic>,
        ),
        updatedAt: maybeParseDateTime(
          checkedKey(json, 'updated_at') as String?,
        ),
        contentReportsEnabled: json['content_reports_enabled'] as bool?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommunityProfile? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CommunityProfile.fromJson(json);
  }

  /// Example: `100`
  final int healthPercentage;

  /// Example: `'My first repository on GitHub!'`
  final String? description;

  /// Example: `'example.com'`
  final String? documentation;
  final CommunityProfileFiles files;

  /// Example: `'2017-02-28T19:09:29Z'`
  final DateTime? updatedAt;

  /// Example: `true`
  final bool? contentReportsEnabled;

  /// Converts a [CommunityProfile] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'health_percentage': healthPercentage,
      'description': description,
      'documentation': documentation,
      'files': files.toJson(),
      'updated_at': updatedAt?.toIso8601String(),
      if (contentReportsEnabled != null)
        'content_reports_enabled': contentReportsEnabled,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    healthPercentage,
    description,
    documentation,
    files,
    updatedAt,
    contentReportsEnabled,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommunityProfile &&
        healthPercentage == other.healthPercentage &&
        description == other.description &&
        documentation == other.documentation &&
        files == other.files &&
        updatedAt == other.updatedAt &&
        contentReportsEnabled == other.contentReportsEnabled;
  }
}
