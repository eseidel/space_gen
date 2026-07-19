// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/action_row_component_for_message_request.dart';
import 'package:discord/messages/container_component_for_message_request.dart';
import 'package:discord/messages/file_component_for_message_request.dart';
import 'package:discord/messages/media_gallery_component_for_message_request.dart';
import 'package:discord/messages/section_component_for_message_request.dart';
import 'package:discord/messages/separator_component_for_message_request.dart';
import 'package:discord/messages/text_display_component_for_message_request.dart';
import 'package:meta/meta.dart';

sealed class MessageEditRequestPartialComponentsInner {
  const MessageEditRequestPartialComponentsInner();

  factory MessageEditRequestPartialComponentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 =>
        MessageEditRequestPartialComponentsInnerActionRowComponentForMessageRequest(
          ActionRowComponentForMessageRequest.fromJson(json),
        ),
      17 =>
        MessageEditRequestPartialComponentsInnerContainerComponentForMessageRequest(
          ContainerComponentForMessageRequest.fromJson(json),
        ),
      13 =>
        MessageEditRequestPartialComponentsInnerFileComponentForMessageRequest(
          FileComponentForMessageRequest.fromJson(json),
        ),
      12 =>
        MessageEditRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest(
          MediaGalleryComponentForMessageRequest.fromJson(json),
        ),
      9 =>
        MessageEditRequestPartialComponentsInnerSectionComponentForMessageRequest(
          SectionComponentForMessageRequest.fromJson(json),
        ),
      14 =>
        MessageEditRequestPartialComponentsInnerSeparatorComponentForMessageRequest(
          SeparatorComponentForMessageRequest.fromJson(json),
        ),
      10 =>
        MessageEditRequestPartialComponentsInnerTextDisplayComponentForMessageRequest(
          TextDisplayComponentForMessageRequest.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for MessageEditRequestPartialComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static MessageEditRequestPartialComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return MessageEditRequestPartialComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class MessageEditRequestPartialComponentsInnerActionRowComponentForMessageRequest
    extends MessageEditRequestPartialComponentsInner {
  const MessageEditRequestPartialComponentsInnerActionRowComponentForMessageRequest(
    this.value,
  );

  final ActionRowComponentForMessageRequest value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MessageEditRequestPartialComponentsInnerActionRowComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class MessageEditRequestPartialComponentsInnerContainerComponentForMessageRequest
    extends MessageEditRequestPartialComponentsInner {
  const MessageEditRequestPartialComponentsInnerContainerComponentForMessageRequest(
    this.value,
  );

  final ContainerComponentForMessageRequest value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MessageEditRequestPartialComponentsInnerContainerComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class MessageEditRequestPartialComponentsInnerFileComponentForMessageRequest
    extends MessageEditRequestPartialComponentsInner {
  const MessageEditRequestPartialComponentsInnerFileComponentForMessageRequest(
    this.value,
  );

  final FileComponentForMessageRequest value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MessageEditRequestPartialComponentsInnerFileComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class MessageEditRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest
    extends MessageEditRequestPartialComponentsInner {
  const MessageEditRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest(
    this.value,
  );

  final MediaGalleryComponentForMessageRequest value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MessageEditRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class MessageEditRequestPartialComponentsInnerSectionComponentForMessageRequest
    extends MessageEditRequestPartialComponentsInner {
  const MessageEditRequestPartialComponentsInnerSectionComponentForMessageRequest(
    this.value,
  );

  final SectionComponentForMessageRequest value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MessageEditRequestPartialComponentsInnerSectionComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class MessageEditRequestPartialComponentsInnerSeparatorComponentForMessageRequest
    extends MessageEditRequestPartialComponentsInner {
  const MessageEditRequestPartialComponentsInnerSeparatorComponentForMessageRequest(
    this.value,
  );

  final SeparatorComponentForMessageRequest value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MessageEditRequestPartialComponentsInnerSeparatorComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class MessageEditRequestPartialComponentsInnerTextDisplayComponentForMessageRequest
    extends MessageEditRequestPartialComponentsInner {
  const MessageEditRequestPartialComponentsInnerTextDisplayComponentForMessageRequest(
    this.value,
  );

  final TextDisplayComponentForMessageRequest value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is MessageEditRequestPartialComponentsInnerTextDisplayComponentForMessageRequest &&
        value == other.value;
  }
}
