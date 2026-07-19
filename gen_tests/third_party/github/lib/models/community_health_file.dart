import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template community_health_file}
/// Community Health File
/// {@endtemplate}
@immutable
class CommunityHealthFile {
  /// {@macro community_health_file}
  const CommunityHealthFile({required this.url, required this.htmlUrl});

  /// Converts a `Map<String, dynamic>` to a [CommunityHealthFile].
  factory CommunityHealthFile.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'CommunityHealthFile',
      json,
      () => CommunityHealthFile(
        url: Uri.parse(json['url'] as String),
        htmlUrl: Uri.parse(json['html_url'] as String),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static CommunityHealthFile? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return CommunityHealthFile.fromJson(json);
  }

  final Uri url;
  final Uri htmlUrl;

  /// Converts a [CommunityHealthFile] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'url': url.toString(), 'html_url': htmlUrl.toString()};
  }

  @override
  int get hashCode => Object.hashAll([url, htmlUrl]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CommunityHealthFile &&
        url == other.url &&
        htmlUrl == other.htmlUrl;
  }
}
