import 'package:github/model_helpers.dart';
import 'package:meta/meta.dart';

@immutable
class ChecksUpdateRequestAnyOf1OutputImagesInner {
  const ChecksUpdateRequestAnyOf1OutputImagesInner({
    required this.alt,
    required this.imageUrl,
    this.caption,
  });

  /// Converts a `Map<String, dynamic>` to a
  /// [ChecksUpdateRequestAnyOf1OutputImagesInner].
  factory ChecksUpdateRequestAnyOf1OutputImagesInner.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ChecksUpdateRequestAnyOf1OutputImagesInner',
      json,
      () => ChecksUpdateRequestAnyOf1OutputImagesInner(
        alt: json['alt'] as String,
        imageUrl: json['image_url'] as String,
        caption: json['caption'] as String?,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ChecksUpdateRequestAnyOf1OutputImagesInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ChecksUpdateRequestAnyOf1OutputImagesInner.fromJson(json);
  }

  /// The alternative text for the image.
  final String alt;

  /// The full URL of the image.
  final String imageUrl;

  /// A short image description.
  final String? caption;

  /// Converts a [ChecksUpdateRequestAnyOf1OutputImagesInner]
  /// to a `Map<String, dynamic>`.
  Map<String, dynamic> toJson() {
    return {'alt': alt, 'image_url': imageUrl, 'caption': caption};
  }

  @override
  int get hashCode => Object.hashAll([alt, imageUrl, caption]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChecksUpdateRequestAnyOf1OutputImagesInner &&
        alt == other.alt &&
        imageUrl == other.imageUrl &&
        caption == other.caption;
  }
}
