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

sealed class IncomingWebhookRequestPartialComponentsInner {
  const IncomingWebhookRequestPartialComponentsInner();

  factory IncomingWebhookRequestPartialComponentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 =>
        IncomingWebhookRequestPartialComponentsInnerActionRowComponentForMessageRequest(
          ActionRowComponentForMessageRequest.fromJson(json),
        ),
      17 =>
        IncomingWebhookRequestPartialComponentsInnerContainerComponentForMessageRequest(
          ContainerComponentForMessageRequest.fromJson(json),
        ),
      13 =>
        IncomingWebhookRequestPartialComponentsInnerFileComponentForMessageRequest(
          FileComponentForMessageRequest.fromJson(json),
        ),
      12 =>
        IncomingWebhookRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest(
          MediaGalleryComponentForMessageRequest.fromJson(json),
        ),
      9 =>
        IncomingWebhookRequestPartialComponentsInnerSectionComponentForMessageRequest(
          SectionComponentForMessageRequest.fromJson(json),
        ),
      14 =>
        IncomingWebhookRequestPartialComponentsInnerSeparatorComponentForMessageRequest(
          SeparatorComponentForMessageRequest.fromJson(json),
        ),
      10 =>
        IncomingWebhookRequestPartialComponentsInnerTextDisplayComponentForMessageRequest(
          TextDisplayComponentForMessageRequest.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for IncomingWebhookRequestPartialComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static IncomingWebhookRequestPartialComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return IncomingWebhookRequestPartialComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class IncomingWebhookRequestPartialComponentsInnerActionRowComponentForMessageRequest
    extends IncomingWebhookRequestPartialComponentsInner {
  const IncomingWebhookRequestPartialComponentsInnerActionRowComponentForMessageRequest(
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
            is IncomingWebhookRequestPartialComponentsInnerActionRowComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookRequestPartialComponentsInnerContainerComponentForMessageRequest
    extends IncomingWebhookRequestPartialComponentsInner {
  const IncomingWebhookRequestPartialComponentsInnerContainerComponentForMessageRequest(
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
            is IncomingWebhookRequestPartialComponentsInnerContainerComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookRequestPartialComponentsInnerFileComponentForMessageRequest
    extends IncomingWebhookRequestPartialComponentsInner {
  const IncomingWebhookRequestPartialComponentsInnerFileComponentForMessageRequest(
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
            is IncomingWebhookRequestPartialComponentsInnerFileComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest
    extends IncomingWebhookRequestPartialComponentsInner {
  const IncomingWebhookRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest(
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
            is IncomingWebhookRequestPartialComponentsInnerMediaGalleryComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookRequestPartialComponentsInnerSectionComponentForMessageRequest
    extends IncomingWebhookRequestPartialComponentsInner {
  const IncomingWebhookRequestPartialComponentsInnerSectionComponentForMessageRequest(
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
            is IncomingWebhookRequestPartialComponentsInnerSectionComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookRequestPartialComponentsInnerSeparatorComponentForMessageRequest
    extends IncomingWebhookRequestPartialComponentsInner {
  const IncomingWebhookRequestPartialComponentsInnerSeparatorComponentForMessageRequest(
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
            is IncomingWebhookRequestPartialComponentsInnerSeparatorComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class IncomingWebhookRequestPartialComponentsInnerTextDisplayComponentForMessageRequest
    extends IncomingWebhookRequestPartialComponentsInner {
  const IncomingWebhookRequestPartialComponentsInnerTextDisplayComponentForMessageRequest(
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
            is IncomingWebhookRequestPartialComponentsInnerTextDisplayComponentForMessageRequest &&
        value == other.value;
  }
}
