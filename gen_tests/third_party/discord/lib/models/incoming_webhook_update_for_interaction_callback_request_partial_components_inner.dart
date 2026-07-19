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

sealed class IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner {
  const IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner();

  factory IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 =>
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerActionRowComponentForMessageRequest(
          ActionRowComponentForMessageRequest.fromJson(json),
        ),
      17 =>
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerContainerComponentForMessageRequest(
          ContainerComponentForMessageRequest.fromJson(json),
        ),
      13 =>
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerFileComponentForMessageRequest(
          FileComponentForMessageRequest.fromJson(json),
        ),
      12 =>
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest(
          MediaGalleryComponentForMessageRequest.fromJson(json),
        ),
      9 =>
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerSectionComponentForMessageRequest(
          SectionComponentForMessageRequest.fromJson(json),
        ),
      14 =>
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerSeparatorComponentForMessageRequest(
          SeparatorComponentForMessageRequest.fromJson(json),
        ),
      10 =>
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerTextDisplayComponentForMessageRequest(
          TextDisplayComponentForMessageRequest.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner?
  maybeFromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return null;
    }
    return IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner.fromJson(
      json,
    );
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerActionRowComponentForMessageRequest
    extends
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner {
  const IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerActionRowComponentForMessageRequest(
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
            is IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerActionRowComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerContainerComponentForMessageRequest
    extends
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner {
  const IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerContainerComponentForMessageRequest(
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
            is IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerContainerComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerFileComponentForMessageRequest
    extends
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner {
  const IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerFileComponentForMessageRequest(
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
            is IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerFileComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest
    extends
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner {
  const IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest(
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
            is IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerSectionComponentForMessageRequest
    extends
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner {
  const IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerSectionComponentForMessageRequest(
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
            is IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerSectionComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerSeparatorComponentForMessageRequest
    extends
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner {
  const IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerSeparatorComponentForMessageRequest(
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
            is IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerSeparatorComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerTextDisplayComponentForMessageRequest
    extends
        IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInner {
  const IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerTextDisplayComponentForMessageRequest(
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
            is IncomingWebhookUpdateForInteractionCallbackRequestPartialComponentsInnerTextDisplayComponentForMessageRequest &&
        value == other.value;
  }
}
