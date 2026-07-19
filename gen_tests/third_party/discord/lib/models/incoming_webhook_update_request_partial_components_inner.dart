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

sealed class IncomingWebhookUpdateRequestPartialComponentsInner {
  const IncomingWebhookUpdateRequestPartialComponentsInner();

  factory IncomingWebhookUpdateRequestPartialComponentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 =>
        IncomingWebhookUpdateRequestPartialComponentsInnerActionRowComponentForMessageRequest(
          ActionRowComponentForMessageRequest.fromJson(json),
        ),
      17 =>
        IncomingWebhookUpdateRequestPartialComponentsInnerContainerComponentForMessageRequest(
          ContainerComponentForMessageRequest.fromJson(json),
        ),
      13 =>
        IncomingWebhookUpdateRequestPartialComponentsInnerFileComponentForMessageRequest(
          FileComponentForMessageRequest.fromJson(json),
        ),
      12 =>
        IncomingWebhookUpdateRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest(
          MediaGalleryComponentForMessageRequest.fromJson(json),
        ),
      9 =>
        IncomingWebhookUpdateRequestPartialComponentsInnerSectionComponentForMessageRequest(
          SectionComponentForMessageRequest.fromJson(json),
        ),
      14 =>
        IncomingWebhookUpdateRequestPartialComponentsInnerSeparatorComponentForMessageRequest(
          SeparatorComponentForMessageRequest.fromJson(json),
        ),
      10 =>
        IncomingWebhookUpdateRequestPartialComponentsInnerTextDisplayComponentForMessageRequest(
          TextDisplayComponentForMessageRequest.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for IncomingWebhookUpdateRequestPartialComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IncomingWebhookUpdateRequestPartialComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IncomingWebhookUpdateRequestPartialComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class IncomingWebhookUpdateRequestPartialComponentsInnerActionRowComponentForMessageRequest
    extends IncomingWebhookUpdateRequestPartialComponentsInner {
  const IncomingWebhookUpdateRequestPartialComponentsInnerActionRowComponentForMessageRequest(
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
            is IncomingWebhookUpdateRequestPartialComponentsInnerActionRowComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookUpdateRequestPartialComponentsInnerContainerComponentForMessageRequest
    extends IncomingWebhookUpdateRequestPartialComponentsInner {
  const IncomingWebhookUpdateRequestPartialComponentsInnerContainerComponentForMessageRequest(
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
            is IncomingWebhookUpdateRequestPartialComponentsInnerContainerComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookUpdateRequestPartialComponentsInnerFileComponentForMessageRequest
    extends IncomingWebhookUpdateRequestPartialComponentsInner {
  const IncomingWebhookUpdateRequestPartialComponentsInnerFileComponentForMessageRequest(
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
            is IncomingWebhookUpdateRequestPartialComponentsInnerFileComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookUpdateRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest
    extends IncomingWebhookUpdateRequestPartialComponentsInner {
  const IncomingWebhookUpdateRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest(
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
            is IncomingWebhookUpdateRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookUpdateRequestPartialComponentsInnerSectionComponentForMessageRequest
    extends IncomingWebhookUpdateRequestPartialComponentsInner {
  const IncomingWebhookUpdateRequestPartialComponentsInnerSectionComponentForMessageRequest(
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
            is IncomingWebhookUpdateRequestPartialComponentsInnerSectionComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookUpdateRequestPartialComponentsInnerSeparatorComponentForMessageRequest
    extends IncomingWebhookUpdateRequestPartialComponentsInner {
  const IncomingWebhookUpdateRequestPartialComponentsInnerSeparatorComponentForMessageRequest(
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
            is IncomingWebhookUpdateRequestPartialComponentsInnerSeparatorComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookUpdateRequestPartialComponentsInnerTextDisplayComponentForMessageRequest
    extends IncomingWebhookUpdateRequestPartialComponentsInner {
  const IncomingWebhookUpdateRequestPartialComponentsInnerTextDisplayComponentForMessageRequest(
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
            is IncomingWebhookUpdateRequestPartialComponentsInnerTextDisplayComponentForMessageRequest &&
        value == other.value;
  }
}
