// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/api_exception.dart';
import 'package:discord/messages/button_component_for_message_request.dart';
import 'package:discord/messages/unfurled_media_request.dart';
import 'package:discord/model_helpers.dart';
import 'package:discord/models/message_component_types.dart';
import 'package:meta/meta.dart';

sealed class SectionComponentForMessageRequestAccessory {
  const SectionComponentForMessageRequestAccessory();

  factory SectionComponentForMessageRequestAccessory.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      2 =>
        SectionComponentForMessageRequestAccessoryButtonComponentForMessageRequest(
          ButtonComponentForMessageRequest.fromJson(json),
        ),
      11 => ThumbnailComponentForMessageRequest.fromJson(json),
      _ => throw FormatException(
        "Unknown type '$discriminator' for SectionComponentForMessageRequestAccessory",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SectionComponentForMessageRequestAccessory? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SectionComponentForMessageRequestAccessory.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class SectionComponentForMessageRequestAccessoryButtonComponentForMessageRequest
    extends SectionComponentForMessageRequestAccessory {
  const SectionComponentForMessageRequestAccessoryButtonComponentForMessageRequest(
    this.value,
  );

  final ButtonComponentForMessageRequest value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is SectionComponentForMessageRequestAccessoryButtonComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class ThumbnailComponentForMessageRequest
    extends SectionComponentForMessageRequestAccessory {
  ThumbnailComponentForMessageRequest({
    required this.media,
    this.id,
    this.description,
    this.spoiler,
  }) {
    id?.validate(min: 0);
    description?.validate(minLength: 1, maxLength: 1024);
  }

  /// Converts a `Map<String, dynamic>` to a
  /// [ThumbnailComponentForMessageRequest].
  factory ThumbnailComponentForMessageRequest.fromJson(
    Map<String, dynamic> json,
  ) {
    return parseFromJson(
      'ThumbnailComponentForMessageRequest',
      json,
      () => ThumbnailComponentForMessageRequest(
        id: json['id'] as int?,
        description: json['description'] as String?,
        spoiler: json['spoiler'] as bool?,
        media: UnfurledMediaRequest.fromJson(
          json['media'] as Map<String, dynamic>,
        ),
      ),
    );
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ThumbnailComponentForMessageRequest? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ThumbnailComponentForMessageRequest.fromJson(json);
  }

  MessageComponentTypes get type => MessageComponentTypes.thumbnail;
  final int? id;
  final String? description;
  final bool? spoiler;
  final UnfurledMediaRequest media;

  /// Converts a [ThumbnailComponentForMessageRequest]
  /// to a `Map<String, dynamic>`.
  @override
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'id': id,
      'description': description,
      'spoiler': spoiler,
      'media': media.toJson(),
    };
  }

  @override
  int get hashCode => Object.hashAll([id, description, spoiler, media]);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ThumbnailComponentForMessageRequest &&
        id == other.id &&
        description == other.description &&
        spoiler == other.spoiler &&
        media == other.media;
  }
}
