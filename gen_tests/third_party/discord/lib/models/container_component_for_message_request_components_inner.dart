// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/action_row_component_for_message_request.dart';
import 'package:discord/messages/file_component_for_message_request.dart';
import 'package:discord/messages/media_gallery_component_for_message_request.dart';
import 'package:discord/messages/section_component_for_message_request.dart';
import 'package:discord/messages/separator_component_for_message_request.dart';
import 'package:discord/messages/text_display_component_for_message_request.dart';
import 'package:meta/meta.dart';

sealed class ContainerComponentForMessageRequestComponentsInner {
  const ContainerComponentForMessageRequestComponentsInner();

  factory ContainerComponentForMessageRequestComponentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 =>
        ContainerComponentForMessageRequestComponentsInnerActionRowComponentForMessageRequest(
          ActionRowComponentForMessageRequest.fromJson(json),
        ),
      13 =>
        ContainerComponentForMessageRequestComponentsInnerFileComponentForMessageRequest(
          FileComponentForMessageRequest.fromJson(json),
        ),
      12 =>
        ContainerComponentForMessageRequestComponentsInnerMediaGalleryComponentForMessageRequest(
          MediaGalleryComponentForMessageRequest.fromJson(json),
        ),
      9 =>
        ContainerComponentForMessageRequestComponentsInnerSectionComponentForMessageRequest(
          SectionComponentForMessageRequest.fromJson(json),
        ),
      14 =>
        ContainerComponentForMessageRequestComponentsInnerSeparatorComponentForMessageRequest(
          SeparatorComponentForMessageRequest.fromJson(json),
        ),
      10 =>
        ContainerComponentForMessageRequestComponentsInnerTextDisplayComponentForMessageRequest(
          TextDisplayComponentForMessageRequest.fromJson(json),
        ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for ContainerComponentForMessageRequestComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static ContainerComponentForMessageRequestComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return ContainerComponentForMessageRequestComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class ContainerComponentForMessageRequestComponentsInnerActionRowComponentForMessageRequest
    extends ContainerComponentForMessageRequestComponentsInner {
  const ContainerComponentForMessageRequestComponentsInnerActionRowComponentForMessageRequest(
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
            is ContainerComponentForMessageRequestComponentsInnerActionRowComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class ContainerComponentForMessageRequestComponentsInnerFileComponentForMessageRequest
    extends ContainerComponentForMessageRequestComponentsInner {
  const ContainerComponentForMessageRequestComponentsInnerFileComponentForMessageRequest(
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
            is ContainerComponentForMessageRequestComponentsInnerFileComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class ContainerComponentForMessageRequestComponentsInnerMediaGalleryComponentForMessageRequest
    extends ContainerComponentForMessageRequestComponentsInner {
  const ContainerComponentForMessageRequestComponentsInnerMediaGalleryComponentForMessageRequest(
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
            is ContainerComponentForMessageRequestComponentsInnerMediaGalleryComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class ContainerComponentForMessageRequestComponentsInnerSectionComponentForMessageRequest
    extends ContainerComponentForMessageRequestComponentsInner {
  const ContainerComponentForMessageRequestComponentsInnerSectionComponentForMessageRequest(
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
            is ContainerComponentForMessageRequestComponentsInnerSectionComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class ContainerComponentForMessageRequestComponentsInnerSeparatorComponentForMessageRequest
    extends ContainerComponentForMessageRequestComponentsInner {
  const ContainerComponentForMessageRequestComponentsInnerSeparatorComponentForMessageRequest(
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
            is ContainerComponentForMessageRequestComponentsInnerSeparatorComponentForMessageRequest &&
        value == other.value;
  }
}

@immutable
final class ContainerComponentForMessageRequestComponentsInnerTextDisplayComponentForMessageRequest
    extends ContainerComponentForMessageRequestComponentsInner {
  const ContainerComponentForMessageRequestComponentsInnerTextDisplayComponentForMessageRequest(
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
            is ContainerComponentForMessageRequestComponentsInnerTextDisplayComponentForMessageRequest &&
        value == other.value;
  }
}
