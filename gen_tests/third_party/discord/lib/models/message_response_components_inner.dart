import 'package:discord/messages/action_row_component_response.dart';
import 'package:discord/messages/container_component_response.dart';
import 'package:discord/messages/file_component_response.dart';
import 'package:discord/messages/media_gallery_component_response.dart';
import 'package:discord/messages/section_component_response.dart';
import 'package:discord/messages/separator_component_response.dart';
import 'package:discord/messages/text_display_component_response.dart';
import 'package:meta/meta.dart';

sealed class MessageResponseComponentsInner {
  const MessageResponseComponentsInner();

  factory MessageResponseComponentsInner.fromJson(Map<String, dynamic> json) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => MessageResponseComponentsInnerActionRowComponentResponse(
        ActionRowComponentResponse.fromJson(json),
      ),
      17 => MessageResponseComponentsInnerContainerComponentResponse(
        ContainerComponentResponse.fromJson(json),
      ),
      13 => MessageResponseComponentsInnerFileComponentResponse(
        FileComponentResponse.fromJson(json),
      ),
      12 => MessageResponseComponentsInnerMediaGalleryComponentResponse(
        MediaGalleryComponentResponse.fromJson(json),
      ),
      9 => MessageResponseComponentsInnerSectionComponentResponse(
        SectionComponentResponse.fromJson(json),
      ),
      14 => MessageResponseComponentsInnerSeparatorComponentResponse(
        SeparatorComponentResponse.fromJson(json),
      ),
      10 => MessageResponseComponentsInnerTextDisplayComponentResponse(
        TextDisplayComponentResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for MessageResponseComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageResponseComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MessageResponseComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class MessageResponseComponentsInnerActionRowComponentResponse
    extends MessageResponseComponentsInner {
  const MessageResponseComponentsInnerActionRowComponentResponse(this.value);

  final ActionRowComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageResponseComponentsInnerActionRowComponentResponse &&
        value == other.value;
  }
}

@immutable
final class MessageResponseComponentsInnerContainerComponentResponse
    extends MessageResponseComponentsInner {
  const MessageResponseComponentsInnerContainerComponentResponse(this.value);

  final ContainerComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageResponseComponentsInnerContainerComponentResponse &&
        value == other.value;
  }
}

@immutable
final class MessageResponseComponentsInnerFileComponentResponse
    extends MessageResponseComponentsInner {
  const MessageResponseComponentsInnerFileComponentResponse(this.value);

  final FileComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageResponseComponentsInnerFileComponentResponse &&
        value == other.value;
  }
}

@immutable
final class MessageResponseComponentsInnerMediaGalleryComponentResponse
    extends MessageResponseComponentsInner {
  const MessageResponseComponentsInnerMediaGalleryComponentResponse(this.value);

  final MediaGalleryComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MessageResponseComponentsInnerMediaGalleryComponentResponse &&
        value == other.value;
  }
}

@immutable
final class MessageResponseComponentsInnerSectionComponentResponse
    extends MessageResponseComponentsInner {
  const MessageResponseComponentsInnerSectionComponentResponse(this.value);

  final SectionComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageResponseComponentsInnerSectionComponentResponse &&
        value == other.value;
  }
}

@immutable
final class MessageResponseComponentsInnerSeparatorComponentResponse
    extends MessageResponseComponentsInner {
  const MessageResponseComponentsInnerSeparatorComponentResponse(this.value);

  final SeparatorComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MessageResponseComponentsInnerSeparatorComponentResponse &&
        value == other.value;
  }
}

@immutable
final class MessageResponseComponentsInnerTextDisplayComponentResponse
    extends MessageResponseComponentsInner {
  const MessageResponseComponentsInnerTextDisplayComponentResponse(this.value);

  final TextDisplayComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MessageResponseComponentsInnerTextDisplayComponentResponse &&
        value == other.value;
  }
}
