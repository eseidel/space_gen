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

sealed class IncomingWebhookInteractionRequestComponentsInner {
  const IncomingWebhookInteractionRequestComponentsInner();

  factory IncomingWebhookInteractionRequestComponentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 =>
        IncomingWebhookInteractionRequestComponentsInnerActionRowComponentForMessageRequest(
          ActionRowComponentForMessageRequest.fromJson(json),
        ),
      17 =>
        IncomingWebhookInteractionRequestComponentsInnerContainerComponentForMessageRequest(
          ContainerComponentForMessageRequest.fromJson(json),
        ),
      13 =>
        IncomingWebhookInteractionRequestComponentsInnerFileComponentForMessageRequest(
          FileComponentForMessageRequest.fromJson(json),
        ),
      12 =>
        IncomingWebhookInteractionRequestComponentsInnerMediaGalleryComponentForMessageRequest(
          MediaGalleryComponentForMessageRequest.fromJson(json),
        ),
      9 =>
        IncomingWebhookInteractionRequestComponentsInnerSectionComponentForMessageRequest(
          SectionComponentForMessageRequest.fromJson(json),
        ),
      14 =>
        IncomingWebhookInteractionRequestComponentsInnerSeparatorComponentForMessageRequest(
          SeparatorComponentForMessageRequest.fromJson(json),
        ),
      10 =>
        IncomingWebhookInteractionRequestComponentsInnerTextDisplayComponentForMessageRequest(
          TextDisplayComponentForMessageRequest.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for IncomingWebhookInteractionRequestComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IncomingWebhookInteractionRequestComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IncomingWebhookInteractionRequestComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class IncomingWebhookInteractionRequestComponentsInnerActionRowComponentForMessageRequest
    extends IncomingWebhookInteractionRequestComponentsInner {
  const IncomingWebhookInteractionRequestComponentsInnerActionRowComponentForMessageRequest(
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
            is IncomingWebhookInteractionRequestComponentsInnerActionRowComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookInteractionRequestComponentsInnerContainerComponentForMessageRequest
    extends IncomingWebhookInteractionRequestComponentsInner {
  const IncomingWebhookInteractionRequestComponentsInnerContainerComponentForMessageRequest(
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
            is IncomingWebhookInteractionRequestComponentsInnerContainerComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookInteractionRequestComponentsInnerFileComponentForMessageRequest
    extends IncomingWebhookInteractionRequestComponentsInner {
  const IncomingWebhookInteractionRequestComponentsInnerFileComponentForMessageRequest(
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
            is IncomingWebhookInteractionRequestComponentsInnerFileComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookInteractionRequestComponentsInnerMediaGalleryComponentForMessageRequest
    extends IncomingWebhookInteractionRequestComponentsInner {
  const IncomingWebhookInteractionRequestComponentsInnerMediaGalleryComponentForMessageRequest(
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
            is IncomingWebhookInteractionRequestComponentsInnerMediaGalleryComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookInteractionRequestComponentsInnerSectionComponentForMessageRequest
    extends IncomingWebhookInteractionRequestComponentsInner {
  const IncomingWebhookInteractionRequestComponentsInnerSectionComponentForMessageRequest(
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
            is IncomingWebhookInteractionRequestComponentsInnerSectionComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookInteractionRequestComponentsInnerSeparatorComponentForMessageRequest
    extends IncomingWebhookInteractionRequestComponentsInner {
  const IncomingWebhookInteractionRequestComponentsInnerSeparatorComponentForMessageRequest(
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
            is IncomingWebhookInteractionRequestComponentsInnerSeparatorComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookInteractionRequestComponentsInnerTextDisplayComponentForMessageRequest
    extends IncomingWebhookInteractionRequestComponentsInner {
  const IncomingWebhookInteractionRequestComponentsInnerTextDisplayComponentForMessageRequest(
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
            is IncomingWebhookInteractionRequestComponentsInnerTextDisplayComponentForMessageRequest &&
        value == other.value;
  }
}
