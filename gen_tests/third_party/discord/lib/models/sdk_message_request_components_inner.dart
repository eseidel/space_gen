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

sealed class SdkMessageRequestComponentsInner {
  const SdkMessageRequestComponentsInner();

  factory SdkMessageRequestComponentsInner.fromJson(Map<String, dynamic> json) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => SdkMessageRequestComponentsInnerActionRowComponentForMessageRequest(
        ActionRowComponentForMessageRequest.fromJson(json),
      ),
      17 => SdkMessageRequestComponentsInnerContainerComponentForMessageRequest(
        ContainerComponentForMessageRequest.fromJson(json),
      ),
      13 => SdkMessageRequestComponentsInnerFileComponentForMessageRequest(
        FileComponentForMessageRequest.fromJson(json),
      ),
      12 =>
        SdkMessageRequestComponentsInnerMediaGalleryComponentForMessageRequest(
          MediaGalleryComponentForMessageRequest.fromJson(json),
        ),
      9 => SdkMessageRequestComponentsInnerSectionComponentForMessageRequest(
        SectionComponentForMessageRequest.fromJson(json),
      ),
      14 => SdkMessageRequestComponentsInnerSeparatorComponentForMessageRequest(
        SeparatorComponentForMessageRequest.fromJson(json),
      ),
      10 =>
        SdkMessageRequestComponentsInnerTextDisplayComponentForMessageRequest(
          TextDisplayComponentForMessageRequest.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for SdkMessageRequestComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static SdkMessageRequestComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return SdkMessageRequestComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class SdkMessageRequestComponentsInnerActionRowComponentForMessageRequest
    extends SdkMessageRequestComponentsInner {
  const SdkMessageRequestComponentsInnerActionRowComponentForMessageRequest(
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
            is SdkMessageRequestComponentsInnerActionRowComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class SdkMessageRequestComponentsInnerContainerComponentForMessageRequest
    extends SdkMessageRequestComponentsInner {
  const SdkMessageRequestComponentsInnerContainerComponentForMessageRequest(
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
            is SdkMessageRequestComponentsInnerContainerComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class SdkMessageRequestComponentsInnerFileComponentForMessageRequest
    extends SdkMessageRequestComponentsInner {
  const SdkMessageRequestComponentsInnerFileComponentForMessageRequest(
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
            is SdkMessageRequestComponentsInnerFileComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class SdkMessageRequestComponentsInnerMediaGalleryComponentForMessageRequest
    extends SdkMessageRequestComponentsInner {
  const SdkMessageRequestComponentsInnerMediaGalleryComponentForMessageRequest(
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
            is SdkMessageRequestComponentsInnerMediaGalleryComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class SdkMessageRequestComponentsInnerSectionComponentForMessageRequest
    extends SdkMessageRequestComponentsInner {
  const SdkMessageRequestComponentsInnerSectionComponentForMessageRequest(
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
            is SdkMessageRequestComponentsInnerSectionComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class SdkMessageRequestComponentsInnerSeparatorComponentForMessageRequest
    extends SdkMessageRequestComponentsInner {
  const SdkMessageRequestComponentsInnerSeparatorComponentForMessageRequest(
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
            is SdkMessageRequestComponentsInnerSeparatorComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class SdkMessageRequestComponentsInnerTextDisplayComponentForMessageRequest
    extends SdkMessageRequestComponentsInner {
  const SdkMessageRequestComponentsInnerTextDisplayComponentForMessageRequest(
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
            is SdkMessageRequestComponentsInnerTextDisplayComponentForMessageRequest &&
        value == other.value;
  }
}
