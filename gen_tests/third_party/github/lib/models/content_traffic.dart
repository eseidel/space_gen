import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template content_traffic}
/// Content Traffic
/// Content Traffic
/// {@endtemplate}
@immutable
class ContentTraffic {
  /// {@macro content_traffic}
  const ContentTraffic({
    required this.path,
    required this.title,
    required this.count,
    required this.uniques,
  });

  /// Converts a `Map<String, dynamic>` to a [ContentTraffic].
  factory ContentTraffic.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ContentTraffic',
      json,
      () => ContentTraffic(
        path: json['path'] as String,
        title: json['title'] as String,
        count: json['count'] as int,
        uniques: json['uniques'] as int,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContentTraffic? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ContentTraffic.fromJson(json);
  }

  /// Example: `'/github/hubot'`
  final String path;

  /// Example: `'github/hubot: A customizable life embetterment robot.'`
  final String title;

  /// Example: `3542`
  final int count;

  /// Example: `2225`
  final int uniques;

  /// Converts a [ContentTraffic] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'path': path, 'title': title, 'count': count, 'uniques': uniques};
  }

  @override
  int get hashCode => Object.hashAll([path, title, count, uniques]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ContentTraffic &&
        path == other.path &&
        title == other.title &&
        count == other.count &&
        uniques == other.uniques;
  }
}
