import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ReposCreateAutolinkRequest {
  const ReposCreateAutolinkRequest({
    required this.keyPrefix,
    required this.urlTemplate,
    this.isAlphanumeric = true,
  });

  /// Converts a `Map<String, dynamic>` to a [ReposCreateAutolinkRequest].
  factory ReposCreateAutolinkRequest.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ReposCreateAutolinkRequest',
      json,
      () => ReposCreateAutolinkRequest(
        keyPrefix: json['key_prefix'] as String,
        urlTemplate: json['url_template'] as String,
        isAlphanumeric: (json['is_alphanumeric'] as bool?) ?? true,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ReposCreateAutolinkRequest? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ReposCreateAutolinkRequest.fromJson(json);
  }

  /// This prefix appended by certain characters will generate a link any time
  /// it is found in an issue, pull request, or commit.
  final String keyPrefix;

  /// The URL must contain `<num>` for the reference number. `<num>` matches
  /// different characters depending on the value of `is_alphanumeric`.
  final String urlTemplate;

  /// Whether this autolink reference matches alphanumeric characters. If
  /// true, the `<num>` parameter of the `url_template` matches alphanumeric
  /// characters `A-Z` (case insensitive), `0-9`, and `-`. If false, this
  /// autolink reference only matches numeric characters.
  final bool isAlphanumeric;

  /// Converts a [ReposCreateAutolinkRequest] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'key_prefix': keyPrefix,
      'url_template': urlTemplate,
      'is_alphanumeric': isAlphanumeric,
    };
  }

  @override
  int get hashCode => Object.hashAll([keyPrefix, urlTemplate, isAlphanumeric]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ReposCreateAutolinkRequest &&
        keyPrefix == other.keyPrefix &&
        urlTemplate == other.urlTemplate &&
        isAlphanumeric == other.isAlphanumeric;
  }
}
