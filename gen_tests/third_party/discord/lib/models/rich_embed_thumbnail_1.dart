import 'package:discord/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class RichEmbedThumbnail1 {
  const RichEmbedThumbnail1({
    this.url,
    this.width,
    this.height,
    this.placeholder,
    this.placeholderVersion,
    this.isAnimated,
    this.description,
  });

  /// Converts a `Map<String, dynamic>` to a [RichEmbedThumbnail1].
  factory RichEmbedThumbnail1.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'RichEmbedThumbnail1',
      json,
      () => RichEmbedThumbnail1(
        url: maybeParseUri(json['url'] as String?),
        width: json['width'] as int?,
        height: json['height'] as int?,
        placeholder: json['placeholder'] as String?,
        placeholderVersion: json['placeholder_version'] as int?,
        isAnimated: json['is_animated'] as bool?,
        description: json['description'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static RichEmbedThumbnail1? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return RichEmbedThumbnail1.fromJson(json);
  }

  final Uri? url;
  final int? width;
  final int? height;
  final String? placeholder;
  final int? placeholderVersion;
  final bool? isAnimated;
  final String? description;

  /// Converts a [RichEmbedThumbnail1] to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {
      'url': url?.toString(),
      'width': width,
      'height': height,
      'placeholder': placeholder,
      'placeholder_version': placeholderVersion,
      'is_animated': isAnimated,
      'description': description,
    };
  }

  @override
  int get hashCode => Object.hashAll([
    url,
    width,
    height,
    placeholder,
    placeholderVersion,
    isAnimated,
    description,
  ]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is RichEmbedThumbnail1 &&
        url == other.url &&
        width == other.width &&
        height == other.height &&
        placeholder == other.placeholder &&
        placeholderVersion == other.placeholderVersion &&
        isAnimated == other.isAnimated &&
        description == other.description;
  }
}
