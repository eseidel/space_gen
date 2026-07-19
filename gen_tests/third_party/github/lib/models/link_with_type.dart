import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template link_with_type}
/// Link With Type
/// Hypermedia Link with Type
/// {@endtemplate}
@immutable
class LinkWithType {
  /// {@macro link_with_type}
  const LinkWithType({required this.href, required this.type});

  /// Converts a `Map<String, dynamic>` to a [LinkWithType].
  factory LinkWithType.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'LinkWithType',
      json,
      () => LinkWithType(
        href: json['href'] as String,
        type: json['type'] as String,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static LinkWithType? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return LinkWithType.fromJson(json);
  }

  final String href;
  final String type;

  /// Converts a [LinkWithType] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'href': href, 'type': type};
  }

  @override
  int get hashCode => Object.hashAll([href, type]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LinkWithType && href == other.href && type == other.type;
  }
}
