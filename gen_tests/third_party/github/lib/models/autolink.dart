import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

/// {@template autolink}
/// Autolink reference
/// An autolink reference.
/// {@endtemplate}
@immutable
class Autolink {
  /// {@macro autolink}
  const Autolink({
    required this.id,
    required this.keyPrefix,
    required this.urlTemplate,
    required this.isAlphanumeric,
  });

  /// Converts a `Map<String, dynamic>` to an [Autolink].
  factory Autolink.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'Autolink',
      json,
      () => Autolink(
        id: json['id'] as int,
        keyPrefix: json['key_prefix'] as String,
        urlTemplate: json['url_template'] as String,
        isAlphanumeric: json['is_alphanumeric'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static Autolink? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return Autolink.fromJson(json);
  }

  /// Example: `3`
  final int id;

  /// The prefix of a key that is linkified.
  /// Example: `'TICKET-'`
  final String keyPrefix;

  /// A template for the target URL that is generated if a key was found.
  /// Example: `'https://example.com/TICKET?query=<num>'`
  final String urlTemplate;

  /// Whether this autolink reference matches alphanumeric characters. If
  /// false, this autolink reference only matches numeric characters.
  /// Example: `true`
  final bool isAlphanumeric;

  /// Converts an [Autolink] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'key_prefix': keyPrefix,
      'url_template': urlTemplate,
      'is_alphanumeric': isAlphanumeric,
    };
  }

  @override
  int get hashCode =>
      Object.hashAll([id, keyPrefix, urlTemplate, isAlphanumeric]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Autolink &&
        id == other.id &&
        keyPrefix == other.keyPrefix &&
        urlTemplate == other.urlTemplate &&
        isAlphanumeric == other.isAlphanumeric;
  }
}
