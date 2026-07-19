import 'package:discord/messages/button_component_response.dart';
import 'package:discord/messages/unfurled_media_response.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:meta/meta.dart';

sealed class SectionComponentResponseAccessory {
  const SectionComponentResponseAccessory();

  factory SectionComponentResponseAccessory.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 => SectionComponentResponseAccessoryButtonComponentResponse(
        ButtonComponentResponse.fromJson(json),
      ),
      11 => ThumbnailComponentResponse.fromJson(json),
      _ => throw FormatException(
        "Unknown type '$discriminator' for SectionComponentResponseAccessory",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SectionComponentResponseAccessory? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SectionComponentResponseAccessory.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class SectionComponentResponseAccessoryButtonComponentResponse
    extends SectionComponentResponseAccessory {
  const SectionComponentResponseAccessoryButtonComponentResponse(this.value);

  final ButtonComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is SectionComponentResponseAccessoryButtonComponentResponse &&
        value == other.value;
  }
}

@immutable
final class ThumbnailComponentResponse
    extends SectionComponentResponseAccessory {
  const ThumbnailComponentResponse({
    required this.id,
    required this.media,
    required this.description,
    required this.spoiler,
  });

  /// Converts a `Map<String, dynamic>` to a [ThumbnailComponentResponse].
  factory ThumbnailComponentResponse.fromJson(Map<String, dynamic> json) {
    return parseFromJson(
      'ThumbnailComponentResponse',
      json,
      () => ThumbnailComponentResponse(
        id: json['id'] as int,
        media: UnfurledMediaResponse.fromJson(
          json['media'] as Map<String, dynamic>,
        ),
        description: checkedKey(json, 'description') as String?,
        spoiler: json['spoiler'] as bool,
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ThumbnailComponentResponse? maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return ThumbnailComponentResponse.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.thumbnail;
  final int id;
  final UnfurledMediaResponse media;
  final String? description;
  final bool spoiler;

  /// Converts a [ThumbnailComponentResponse] to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'media': media.toJson(),
      'description': description,
      'spoiler': spoiler,
    };
  }

  @override
  int get hashCode => Object.hashAll([id, media, description, spoiler]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThumbnailComponentResponse &&
        id == other.id &&
        media == other.media &&
        description == other.description &&
        spoiler == other.spoiler;
  }
}
