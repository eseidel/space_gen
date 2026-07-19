import 'package:backstage/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template entity_link}
/// A link to external information that is related to the entity.
/// {@endtemplate}
@immutable
class EntityLink {
  /// {@macro entity_link}
  const EntityLink({required this.url, this.type, this.icon, this.title});

  /// Converts a `Map<String, dynamic>` to an [EntityLink].
  factory EntityLink.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'EntityLink',
      json,
      () => EntityLink(
        type: json['type'] as String?,
        icon: json['icon'] as String?,
        title: json['title'] as String?,
        url: json['url'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static EntityLink? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return EntityLink.fromJson(json);
  }

  /// An optional value to categorize links into specific groups
  final String? type;

  /// An optional semantic key that represents a visual icon.
  final String? icon;

  /// An optional descriptive title for the link.
  final String? title;

  /// The url to the external site, document, etc.
  final String url;

  /// Converts an [EntityLink] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'type': type, 'icon': icon, 'title': title, 'url': url};
  }

  @override
  int get hashCode => Object.hashAll([type, icon, title, url]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is EntityLink &&
        type == other.type &&
        icon == other.icon &&
        title == other.title &&
        url == other.url;
  }
}
