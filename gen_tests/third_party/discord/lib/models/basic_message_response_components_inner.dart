// Some OpenAPI specs flatten inline schemas into class names long
// enough that `dart format` can't keep imports and call sites under
// 80 cols as bare identifiers.
// ignore_for_file: lines_longer_than_80_chars
import 'package:discord/messages/action_row_component_response.dart';
import 'package:discord/messages/container_component_response.dart';
import 'package:discord/messages/file_component_response.dart';
import 'package:discord/messages/media_gallery_component_response.dart';
import 'package:discord/messages/section_component_response.dart';
import 'package:discord/messages/separator_component_response.dart';
import 'package:discord/messages/text_display_component_response.dart';
import 'package:meta/meta.dart';

sealed class BasicMessageResponseComponentsInner {
  const BasicMessageResponseComponentsInner();

  factory BasicMessageResponseComponentsInner.fromJson(
    Map<String, dynamic> json,
  ) {
    final discriminator = json['type'];
    return switch (discriminator) {
      1 => BasicMessageResponseComponentsInnerActionRowComponentResponse(
        ActionRowComponentResponse.fromJson(json),
      ),
      17 => BasicMessageResponseComponentsInnerContainerComponentResponse(
        ContainerComponentResponse.fromJson(json),
      ),
      13 => BasicMessageResponseComponentsInnerFileComponentResponse(
        FileComponentResponse.fromJson(json),
      ),
      12 => BasicMessageResponseComponentsInnerMediaGalleryComponentResponse(
        MediaGalleryComponentResponse.fromJson(json),
      ),
      9 => BasicMessageResponseComponentsInnerSectionComponentResponse(
        SectionComponentResponse.fromJson(json),
      ),
      14 => BasicMessageResponseComponentsInnerSeparatorComponentResponse(
        SeparatorComponentResponse.fromJson(json),
      ),
      10 => BasicMessageResponseComponentsInnerTextDisplayComponentResponse(
        TextDisplayComponentResponse.fromJson(json),
      ),
      _ => throw FormatException(
        "Unknown type '$discriminator' for BasicMessageResponseComponentsInner",
      ),
    };
  }

  /// Convenience to create a nullable type from a nullable json object.
  /// Useful when parsing optional fields.
  static BasicMessageResponseComponentsInner? maybeFromJson(
    Map<String, dynamic>? json,
  ) {
    if (json == null) {
      return null;
    }
    return BasicMessageResponseComponentsInner.fromJson(json);
  }

  /// Require all subclasses to implement toJson.
  Map<String, dynamic> toJson();
}

@immutable
final class BasicMessageResponseComponentsInnerActionRowComponentResponse
    extends BasicMessageResponseComponentsInner {
  const BasicMessageResponseComponentsInnerActionRowComponentResponse(
    this.value,
  );

  final ActionRowComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is BasicMessageResponseComponentsInnerActionRowComponentResponse &&
        value == other.value;
  }
}

@immutable
final class BasicMessageResponseComponentsInnerContainerComponentResponse
    extends BasicMessageResponseComponentsInner {
  const BasicMessageResponseComponentsInnerContainerComponentResponse(
    this.value,
  );

  final ContainerComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is BasicMessageResponseComponentsInnerContainerComponentResponse &&
        value == other.value;
  }
}

@immutable
final class BasicMessageResponseComponentsInnerFileComponentResponse
    extends BasicMessageResponseComponentsInner {
  const BasicMessageResponseComponentsInnerFileComponentResponse(this.value);

  final FileComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BasicMessageResponseComponentsInnerFileComponentResponse &&
        value == other.value;
  }
}

@immutable
final class BasicMessageResponseComponentsInnerMediaGalleryComponentResponse
    extends BasicMessageResponseComponentsInner {
  const BasicMessageResponseComponentsInnerMediaGalleryComponentResponse(
    this.value,
  );

  final MediaGalleryComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is BasicMessageResponseComponentsInnerMediaGalleryComponentResponse &&
        value == other.value;
  }
}

@immutable
final class BasicMessageResponseComponentsInnerSectionComponentResponse
    extends BasicMessageResponseComponentsInner {
  const BasicMessageResponseComponentsInnerSectionComponentResponse(this.value);

  final SectionComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is BasicMessageResponseComponentsInnerSectionComponentResponse &&
        value == other.value;
  }
}

@immutable
final class BasicMessageResponseComponentsInnerSeparatorComponentResponse
    extends BasicMessageResponseComponentsInner {
  const BasicMessageResponseComponentsInnerSeparatorComponentResponse(
    this.value,
  );

  final SeparatorComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is BasicMessageResponseComponentsInnerSeparatorComponentResponse &&
        value == other.value;
  }
}

@immutable
final class BasicMessageResponseComponentsInnerTextDisplayComponentResponse
    extends BasicMessageResponseComponentsInner {
  const BasicMessageResponseComponentsInnerTextDisplayComponentResponse(
    this.value,
  );

  final TextDisplayComponentResponse value;

  @override
  Map<String, dynamic> toJson() => value.toJson();

  @override
  int get hashCode => value.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other
            is BasicMessageResponseComponentsInnerTextDisplayComponentResponse &&
        value == other.value;
  }
}
