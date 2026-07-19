import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template link}
/// Link
/// Hypermedia Link
/// {@endtemplate}
@immutable
class Link {
  /// {@macro link}
  const Link({required this.href});

  /// Converts a `Map<String, dynamic>` to a [Link].
  factory Link.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Link',
      json,
      () => Link(href: json['href'] as String),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Link? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Link.fromJson(json);
  }

  final String href;

  /// Converts a [Link] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'href': href};
  }

  @override
  int get hashCode => href.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Link && href == other.href;
  }
}
